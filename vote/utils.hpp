#pragma once
#include<vector>
#include<string>

const std::vector<std::string> split(const std::string& s, const char& t) {
    std::string buff;
    std::vector<std::string> z;

    for (auto c: s) {
        if (c != t) buff += c; 
        else { 
            z.push_back(buff); 
            buff.clear(); 
        }
    }
    if (!buff.empty()) z.push_back(buff);
    return z;
}