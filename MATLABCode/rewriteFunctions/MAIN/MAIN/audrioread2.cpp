#include "audioread2.h"
#include <string.h>
#include <fstream>
#include <sstream>


using namespace std;

double *audioread2(string fileName, int length)
{
	/*
	const char* fileName2 = fileName.c_str(); // Convert to const char *
	FILE *fp;	
	errno_t err;
	err = fopen_s(&fp, fileName2, "r"); // Opens file as read onlys
	return 0;
	*/
	const int size = length;

	ifstream myReadFile;
	myReadFile.open(fileName);
	char output[500];
	if (myReadFile.is_open()) {
		while (!myReadFile.eof()) {


			myReadFile >> output;


		}
	}
	myReadFile.close();
	return 0;
}