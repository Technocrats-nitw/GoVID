
import codecs
from setuptools import setup, find_packages

with codecs.open('README.md', 'r', 'utf8') as reader:
    long_description = reader.read()


with codecs.open('requirements.txt', 'r', 'utf8') as reader:
    install_requires = list(map(lambda x: x.strip(), reader.readlines()))


setup(
    name='voctor',
    version='2.0',
    packages=find_packages(),
    #url='https://github.com/technocrats/voctor',
    license='MIT',
    author='Technocrats',
    author_email='shivanshuman021@gmail.com',
    long_description_content_taype='text/markdown',
    python_requires='>=3.5.0',
    install_requires=install_requires,
    classifiers=(
        "Programming Language :: Python :: 2.7",
        "Programming Language :: Python :: 3.6",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ),
)
