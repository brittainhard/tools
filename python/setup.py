import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="mytools",
    version="0.0.1",
    author="Brittain Hard",
    author_email="brittainhard@gmail.com",
    description="Package containing some useful and not-so-useful code segments that I want to keep as an easily-installed package.",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/brittainhard/mytools",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.6',
    install_requires=[
        "requests"
    ]
)
