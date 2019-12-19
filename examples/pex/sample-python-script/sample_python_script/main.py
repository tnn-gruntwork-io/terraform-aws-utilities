from __future__ import print_function
import os
import click
import json
import sys


@click.command()
@click.option("--is-data/--no-is-data", default=False, help="Whether or not this is run as a data source")
@click.option("--is-delete/--no-is-delete", default=False, help="Whether or not this is run as a delete provisioner")
def main(is_data, is_delete):
    if is_data:
        query = json.loads(sys.stdin.read())
        print(
            json.dumps(
                {
                    "echo": query.get("echo", ""),
                    "out": "This was successfully run as data source.",
                    "python_version_info": str(sys.version_info),
                }
            )
        )
    elif is_delete:
        print("python version: {}".format(sys.version_info))
        print("This was successfully run as a ___DELETE___ local-exec provisioner")
        print("Environment variable: {}".format(os.environ.get("RUN_PEX_TEST_ENV", None)))
    else:
        print("python version: {}".format(sys.version_info))
        print("This was successfully run as a local-exec provisioner")
        print("Environment variable: {}".format(os.environ.get("RUN_PEX_TEST_ENV", None)))


if __name__ == "__main__":
    main()
