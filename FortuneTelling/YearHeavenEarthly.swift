//
//  YearHeavenEarthlyData.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/28.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation

struct YearHeavenEarthlyData {
    
    let absoluteTime: String
    
    let order: Int
    
    let heaven: String
    
    let earthly: String
    
}

class YearHeavenEarthly {
    
    static let shared: YearHeavenEarthly = YearHeavenEarthly()
    
    private init() {}
    
    let yearHeavenEarthlyData: [YearHeavenEarthlyData] = [
        YearHeavenEarthlyData(absoluteTime: "1924-2-5 09:52", order: 1, heaven: "甲", earthly: "子"),
        YearHeavenEarthlyData(absoluteTime: "1925-2-4 15:41", order: 2, heaven: "乙", earthly: "丑"),
        YearHeavenEarthlyData(absoluteTime: "1926-2-4 21:34", order: 3, heaven: "丙", earthly: "寅"),
        YearHeavenEarthlyData(absoluteTime: "1927-2-5 03:19", order: 4, heaven: "丁", earthly: "卯"),
        YearHeavenEarthlyData(absoluteTime: "1928-2-5 09:11", order: 5, heaven: "戊", earthly: "辰"),
        YearHeavenEarthlyData(absoluteTime: "1929-2-4 15:02", order: 6, heaven: "己", earthly: "巳"),
        YearHeavenEarthlyData(absoluteTime: "1930-2-4 20:47", order: 7, heaven: "庚", earthly: "午"),
        YearHeavenEarthlyData(absoluteTime: "1931-2-5 02:41", order: 8, heaven: "辛", earthly: "未"),
        YearHeavenEarthlyData(absoluteTime: "1932-2-5 08:29", order: 9, heaven: "壬", earthly: "申"),
        YearHeavenEarthlyData(absoluteTime: "1933-2-4 14:16", order: 10, heaven: "癸", earthly: "酉"),
        YearHeavenEarthlyData(absoluteTime: "1934-2-4 20:10", order: 11, heaven: "甲", earthly: "戌"),
        YearHeavenEarthlyData(absoluteTime: "1935-2-5 01:56", order: 12, heaven: "乙", earthly: "亥"),
        YearHeavenEarthlyData(absoluteTime: "1936-2-5 07:46", order: 13, heaven: "丙", earthly: "子"),
        YearHeavenEarthlyData(absoluteTime: "1937-2-4 13:39", order: 14, heaven: "丁", earthly: "丑"),
        YearHeavenEarthlyData(absoluteTime: "1938-2-4 19:23", order: 15, heaven: "戊", earthly: "寅"),
        YearHeavenEarthlyData(absoluteTime: "1939-2-5 01:16", order: 16, heaven: "己", earthly: "卯"),
        YearHeavenEarthlyData(absoluteTime: "1940-2-5 07:06", order: 17, heaven: "庚", earthly: "辰"),
        YearHeavenEarthlyData(absoluteTime: "1941-2-4 12:52", order: 18, heaven: "辛", earthly: "巳"),
        YearHeavenEarthlyData(absoluteTime: "1942-2-4 18:46", order: 19, heaven: "壬", earthly: "午"),
        YearHeavenEarthlyData(absoluteTime: "1943-2-5 00:33", order: 20, heaven: "癸", earthly: "未"),
        YearHeavenEarthlyData(absoluteTime: "1944-2-5 06:21", order: 21, heaven: "甲", earthly: "申"),
        YearHeavenEarthlyData(absoluteTime: "1945-2-4 12:15", order: 22, heaven: "乙", earthly: "酉"),
        YearHeavenEarthlyData(absoluteTime: "1946-2-4 18:00", order: 23, heaven: "丙", earthly: "戌"),
        YearHeavenEarthlyData(absoluteTime: "1947-2-4 23:51", order: 24, heaven: "丁", earthly: "亥"),
        YearHeavenEarthlyData(absoluteTime: "1948-2-5 05:43", order: 25, heaven: "戊", earthly: "子"),
        YearHeavenEarthlyData(absoluteTime: "1949-2-4 11:28", order: 26, heaven: "己", earthly: "丑"),
        YearHeavenEarthlyData(absoluteTime: "1950-2-4 17:21", order: 27, heaven: "庚", earthly: "寅"),
        YearHeavenEarthlyData(absoluteTime: "1951-2-4 23:10", order: 28, heaven: "辛", earthly: "卯"),
        YearHeavenEarthlyData(absoluteTime: "1952-2-5 04:57", order: 29, heaven: "壬", earthly: "辰"),
        YearHeavenEarthlyData(absoluteTime: "1953-2-4 10:51", order: 30, heaven: "癸", earthly: "巳"),
        YearHeavenEarthlyData(absoluteTime: "1954-2-4 16:37", order: 31, heaven: "甲", earthly: "午"),
        YearHeavenEarthlyData(absoluteTime: "1955-2-4 22:26", order: 32, heaven: "乙", earthly: "未"),
        YearHeavenEarthlyData(absoluteTime: "1956-2-5 04:19", order: 33, heaven: "丙", earthly: "申"),
        YearHeavenEarthlyData(absoluteTime: "1957-2-4 10:04", order: 34, heaven: "丁", earthly: "酉"),
        YearHeavenEarthlyData(absoluteTime: "1958-2-4 15:57", order: 35, heaven: "戊", earthly: "戌"),
        YearHeavenEarthlyData(absoluteTime: "1959-2-4 21:47", order: 36, heaven: "己", earthly: "亥"),
        YearHeavenEarthlyData(absoluteTime: "1960-2-5 03:32", order: 37, heaven: "庚", earthly: "子"),
        YearHeavenEarthlyData(absoluteTime: "1961-2-4 09:26", order: 38, heaven: "辛", earthly: "丑"),
        YearHeavenEarthlyData(absoluteTime: "1962-2-4 15:13", order: 39, heaven: "壬", earthly: "寅"),
        YearHeavenEarthlyData(absoluteTime: "1963-2-4 21:02", order: 40, heaven: "癸", earthly: "卯"),
        YearHeavenEarthlyData(absoluteTime: "1964-2-5 02:55", order: 41, heaven: "甲", earthly: "辰"),
        YearHeavenEarthlyData(absoluteTime: "1965-2-4 08:40", order: 42, heaven: "乙", earthly: "巳"),
        YearHeavenEarthlyData(absoluteTime: "1966-2-4 14:32", order: 43, heaven: "丙", earthly: "午"),
        YearHeavenEarthlyData(absoluteTime: "1967-2-4 20:23", order: 44, heaven: "丁", earthly: "未"),
        YearHeavenEarthlyData(absoluteTime: "1968-2-5 02:08", order: 45, heaven: "戊", earthly: "申"),
        YearHeavenEarthlyData(absoluteTime: "1969-2-4 08:02", order: 46, heaven: "己", earthly: "酉"),
        YearHeavenEarthlyData(absoluteTime: "1970-2-4 13:50", order: 47, heaven: "庚", earthly: "戌"),
        YearHeavenEarthlyData(absoluteTime: "1971-2-4 19:37", order: 48, heaven: "辛", earthly: "亥"),
        YearHeavenEarthlyData(absoluteTime: "1972-2-5 01:31", order: 49, heaven: "壬", earthly: "子"),
        YearHeavenEarthlyData(absoluteTime: "1973-2-4 07:17", order: 50, heaven: "癸", earthly: "丑"),
        YearHeavenEarthlyData(absoluteTime: "1974-2-4 13:07", order: 51, heaven: "甲", earthly: "寅"),
        YearHeavenEarthlyData(absoluteTime: "1975-2-4 19:00", order: 52, heaven: "乙", earthly: "卯"),
        YearHeavenEarthlyData(absoluteTime: "1976-2-5 00:45", order: 53, heaven: "丙", earthly: "辰"),
        YearHeavenEarthlyData(absoluteTime: "1977-2-4 06:37", order: 54, heaven: "丁", earthly: "巳"),
        YearHeavenEarthlyData(absoluteTime: "1978-2-4 12:27", order: 55, heaven: "戊", earthly: "午"),
        YearHeavenEarthlyData(absoluteTime: "1979-2-4 18:13", order: 56, heaven: "己", earthly: "未"),
        YearHeavenEarthlyData(absoluteTime: "1980-2-5 00:07", order: 57, heaven: "庚", earthly: "申"),
        YearHeavenEarthlyData(absoluteTime: "1981-2-4 05:54", order: 58, heaven: "辛", earthly: "酉"),
        YearHeavenEarthlyData(absoluteTime: "1982-2-4 11:42", order: 59, heaven: "壬", earthly: "戌"),
        YearHeavenEarthlyData(absoluteTime: "1983-2-4 17:36", order: 60, heaven: "癸", earthly: "亥"),
        YearHeavenEarthlyData(absoluteTime: "1984-2-4 23:21", order: 61, heaven: "甲", earthly: "子"),
        YearHeavenEarthlyData(absoluteTime: "1985-2-4 05:12", order: 62, heaven: "乙", earthly: "丑"),
        YearHeavenEarthlyData(absoluteTime: "1986-2-4 11:04", order: 63, heaven: "丙", earthly: "寅"),
        YearHeavenEarthlyData(absoluteTime: "1987-2-4 16:49", order: 64, heaven: "丁", earthly: "卯"),
        YearHeavenEarthlyData(absoluteTime: "1988-2-4 22:42", order: 65, heaven: "戊", earthly: "辰"),
        YearHeavenEarthlyData(absoluteTime: "1989-2-4 04:31", order: 66, heaven: "己", earthly: "巳"),
        YearHeavenEarthlyData(absoluteTime: "1990-2-4 10:18", order: 67, heaven: "庚", earthly: "午"),
        YearHeavenEarthlyData(absoluteTime: "1991-2-4 16:12", order: 68, heaven: "辛", earthly: "未"),
        YearHeavenEarthlyData(absoluteTime: "1992-2-4 21:58", order: 69, heaven: "壬", earthly: "申"),
        YearHeavenEarthlyData(absoluteTime: "1993-2-4 03:47", order: 70, heaven: "癸", earthly: "酉"),
        YearHeavenEarthlyData(absoluteTime: "1994-2-4 09:40", order: 71, heaven: "甲", earthly: "戌"),
        YearHeavenEarthlyData(absoluteTime: "1995-2-4 15:25", order: 72, heaven: "乙", earthly: "亥"),
        YearHeavenEarthlyData(absoluteTime: "1996-2-4 21:18", order: 73, heaven: "丙", earthly: "子"),
        YearHeavenEarthlyData(absoluteTime: "1997-2-4 03:08", order: 74, heaven: "丁", earthly: "丑"),
        YearHeavenEarthlyData(absoluteTime: "1998-2-4 08:53", order: 75, heaven: "戊", earthly: "寅"),
        YearHeavenEarthlyData(absoluteTime: "1999-2-4 14:47", order: 76, heaven: "己", earthly: "卯"),
        YearHeavenEarthlyData(absoluteTime: "2000-2-4 20:35", order: 77, heaven: "庚", earthly: "辰"),
        YearHeavenEarthlyData(absoluteTime: "2001-2-4 02:23", order: 78, heaven: "辛", earthly: "巳"),
        YearHeavenEarthlyData(absoluteTime: "2002-2-4 08:16", order: 79, heaven: "壬", earthly: "午"),
        YearHeavenEarthlyData(absoluteTime: "2003-2-4 14:02", order: 80, heaven: "癸", earthly: "未"),
        YearHeavenEarthlyData(absoluteTime: "2004-2-4 19:53", order: 81, heaven: "甲", earthly: "申"),
        YearHeavenEarthlyData(absoluteTime: "2005-2-4 01:44", order: 82, heaven: "乙", earthly: "酉"),
        YearHeavenEarthlyData(absoluteTime: "2006-2-4 07:29", order: 83, heaven: "丙", earthly: "戌"),
        YearHeavenEarthlyData(absoluteTime: "2007-2-4 13:23", order: 84, heaven: "丁", earthly: "亥"),
        YearHeavenEarthlyData(absoluteTime: "2008-2-4 19:11", order: 85, heaven: "戊", earthly: "子"),
        YearHeavenEarthlyData(absoluteTime: "2009-2-4 00:58", order: 86, heaven: "己", earthly: "丑"),
        YearHeavenEarthlyData(absoluteTime: "2010-2-4 06:52", order: 87, heaven: "庚", earthly: "寅"),
        YearHeavenEarthlyData(absoluteTime: "2011-2-4 12:38", order: 88, heaven: "辛", earthly: "卯"),
        YearHeavenEarthlyData(absoluteTime: "2012-2-4 18:28", order: 89, heaven: "壬", earthly: "辰"),
        YearHeavenEarthlyData(absoluteTime: "2013-2-4 00:21", order: 90, heaven: "癸", earthly: "巳"),
        YearHeavenEarthlyData(absoluteTime: "2014-2-4 06:06", order: 91, heaven: "甲", earthly: "午"),
        YearHeavenEarthlyData(absoluteTime: "2015-2-4 11:58", order: 92, heaven: "乙", earthly: "未"),
        YearHeavenEarthlyData(absoluteTime: "2016-2-4 17:48", order: 93, heaven: "丙", earthly: "申"),
        YearHeavenEarthlyData(absoluteTime: "2017-2-3 23:34", order: 94, heaven: "丁", earthly: "酉"),
        YearHeavenEarthlyData(absoluteTime: "2018-2-4 05:28", order: 95, heaven: "戊", earthly: "戌"),
        YearHeavenEarthlyData(absoluteTime: "2019-2-4 11:15", order: 96, heaven: "己", earthly: "亥"),
        YearHeavenEarthlyData(absoluteTime: "2020-2-4 17:03", order: 97, heaven: "庚", earthly: "子"),
        YearHeavenEarthlyData(absoluteTime: "2021-2-3 22:57", order: 98, heaven: "辛", earthly: "丑"),
        YearHeavenEarthlyData(absoluteTime: "2022-2-4 04:42", order: 99, heaven: "壬", earthly: "寅"),
        YearHeavenEarthlyData(absoluteTime: "2023-2-4 10:33", order: 100, heaven: "癸", earthly: "卯"),
        YearHeavenEarthlyData(absoluteTime: "2024-2-4 16:25", order: 101, heaven: "甲", earthly: "辰"),
        YearHeavenEarthlyData(absoluteTime: "2025-2-3 22:10", order: 102, heaven: "乙", earthly: "巳"),
        YearHeavenEarthlyData(absoluteTime: "2026-2-4 04:03", order: 103, heaven: "丙", earthly: "午"),
        YearHeavenEarthlyData(absoluteTime: "2027-2-4 09:52", order: 104, heaven: "丁", earthly: "未"),
        YearHeavenEarthlyData(absoluteTime: "2028-2-4 15:39", order: 105, heaven: "戊", earthly: "申"),
        YearHeavenEarthlyData(absoluteTime: "2029-2-3 21:33", order: 106, heaven: "己", earthly: "酉"),
        YearHeavenEarthlyData(absoluteTime: "2030-2-4 03:19", order: 107, heaven: "庚", earthly: "戌"),
        YearHeavenEarthlyData(absoluteTime: "2031-2-4 09:08", order: 108, heaven: "辛", earthly: "亥"),
        YearHeavenEarthlyData(absoluteTime: "2032-2-4 15:01", order: 109, heaven: "壬", earthly: "子"),
        YearHeavenEarthlyData(absoluteTime: "2033-2-3 20:46", order: 110, heaven: "癸", earthly: "丑"),
        YearHeavenEarthlyData(absoluteTime: "2034-2-4 02:38", order: 111, heaven: "甲", earthly: "寅"),
        YearHeavenEarthlyData(absoluteTime: "2035-2-4 08:29", order: 112, heaven: "乙", earthly: "卯"),
        YearHeavenEarthlyData(absoluteTime: "2036-2-4 14:14", order: 113, heaven: "丙", earthly: "辰"),
        YearHeavenEarthlyData(absoluteTime: "2037-2-3 20:08", order: 114, heaven: "丁", earthly: "巳"),
        YearHeavenEarthlyData(absoluteTime: "2038-2-4 01:56", order: 115, heaven: "戊", earthly: "午"),
        YearHeavenEarthlyData(absoluteTime: "2039-2-4 07:44", order: 116, heaven: "己", earthly: "未"),
        YearHeavenEarthlyData(absoluteTime: "2040-2-4 13:37", order: 117, heaven: "庚", earthly: "申"),
        YearHeavenEarthlyData(absoluteTime: "2041-2-3 19:23", order: 118, heaven: "辛", earthly: "酉"),
        YearHeavenEarthlyData(absoluteTime: "2042-2-4 01:14", order: 119, heaven: "壬", earthly: "戌"),
        YearHeavenEarthlyData(absoluteTime: "2043-2-4 07:05", order: 120, heaven: "癸", earthly: "亥"),
        YearHeavenEarthlyData(absoluteTime: "2044-2-4 12:50", order: 121, heaven: "甲", earthly: "子"),
        YearHeavenEarthlyData(absoluteTime: "2045-2-3 18:44", order: 122, heaven: "乙", earthly: "丑"),
        YearHeavenEarthlyData(absoluteTime: "2046-2-4 00:33", order: 123, heaven: "丙", earthly: "寅"),
        YearHeavenEarthlyData(absoluteTime: "2047-2-4 06:19", order: 124, heaven: "丁", earthly: "卯"),
        YearHeavenEarthlyData(absoluteTime: "2048-2-4 12:13", order: 125, heaven: "戊", earthly: "辰"),
        YearHeavenEarthlyData(absoluteTime: "2049-2-3 17:59", order: 126, heaven: "己", earthly: "巳"),
        YearHeavenEarthlyData(absoluteTime: "2050-2-3 23:49", order: 127, heaven: "庚", earthly: "午"),
        YearHeavenEarthlyData(absoluteTime: "2051-2-4 05:42", order: 128, heaven: "辛", earthly: "未"),
        YearHeavenEarthlyData(absoluteTime: "2052-2-4 11:27", order: 129, heaven: "壬", earthly: "申"),
        YearHeavenEarthlyData(absoluteTime: "2053-2-3 17:19", order: 130, heaven: "癸", earthly: "酉"),
        YearHeavenEarthlyData(absoluteTime: "2054-2-3 23:09", order: 131, heaven: "甲", earthly: "戌"),
        YearHeavenEarthlyData(absoluteTime: "2055-2-4 04:55", order: 132, heaven: "乙", earthly: "亥"),
        YearHeavenEarthlyData(absoluteTime: "2056-2-4 10:49", order: 133, heaven: "丙", earthly: "子"),
        YearHeavenEarthlyData(absoluteTime: "2057-2-3 16:36", order: 134, heaven: "丁", earthly: "丑"),
        YearHeavenEarthlyData(absoluteTime: "2058-2-3 22:24", order: 135, heaven: "戊", earthly: "寅"),
        YearHeavenEarthlyData(absoluteTime: "2059-2-4 04:18", order: 136, heaven: "己", earthly: "卯"),
        YearHeavenEarthlyData(absoluteTime: "2060-2-4 10:03", order: 137, heaven: "庚", earthly: "辰"),
        YearHeavenEarthlyData(absoluteTime: "2061-2-3 15:54", order: 138, heaven: "辛", earthly: "巳"),
        YearHeavenEarthlyData(absoluteTime: "2062-2-3 21:46", order: 139, heaven: "壬", earthly: "午"),
        YearHeavenEarthlyData(absoluteTime: "2063-2-4 03:31", order: 140, heaven: "癸", earthly: "未"),
        YearHeavenEarthlyData(absoluteTime: "2064-2-4 09:24", order: 141, heaven: "甲", earthly: "申"),
        YearHeavenEarthlyData(absoluteTime: "2065-2-3 15:13", order: 142, heaven: "乙", earthly: "酉"),
        YearHeavenEarthlyData(absoluteTime: "2066-2-3 21:00", order: 143, heaven: "丙", earthly: "戌"),
        YearHeavenEarthlyData(absoluteTime: "2067-2-4 02:54", order: 144, heaven: "丁", earthly: "亥"),
        YearHeavenEarthlyData(absoluteTime: "2068-2-4 08:40", order: 145, heaven: "戊", earthly: "子"),
        YearHeavenEarthlyData(absoluteTime: "2069-2-3 14:29", order: 146, heaven: "己", earthly: "丑"),
        YearHeavenEarthlyData(absoluteTime: "2070-2-3 20:22", order: 147, heaven: "庚", earthly: "寅"),
        YearHeavenEarthlyData(absoluteTime: "2071-2-4 02:07", order: 148, heaven: "辛", earthly: "卯"),
        YearHeavenEarthlyData(absoluteTime: "2072-2-4 07:59", order: 149, heaven: "壬", earthly: "辰"),
        YearHeavenEarthlyData(absoluteTime: "2073-2-3 13:50", order: 150, heaven: "癸", earthly: "巳"),
        YearHeavenEarthlyData(absoluteTime: "2074-2-3 19:35", order: 151, heaven: "甲", earthly: "午"),
        YearHeavenEarthlyData(absoluteTime: "2075-2-4 01:29", order: 152, heaven: "乙", earthly: "未"),
        YearHeavenEarthlyData(absoluteTime: "2076-2-4 07:17", order: 153, heaven: "丙", earthly: "申"),
        YearHeavenEarthlyData(absoluteTime: "2077-2-3 13:05", order: 154, heaven: "丁", earthly: "酉"),
        YearHeavenEarthlyData(absoluteTime: "2078-2-3 18:58", order: 155, heaven: "戊", earthly: "戌"),
        YearHeavenEarthlyData(absoluteTime: "2079-2-4 00:44", order: 156, heaven: "己", earthly: "亥"),
        YearHeavenEarthlyData(absoluteTime: "2080-2-4 06:35", order: 157, heaven: "庚", earthly: "子"),
        YearHeavenEarthlyData(absoluteTime: "2081-2-3 12:26", order: 158, heaven: "辛", earthly: "丑"),
        YearHeavenEarthlyData(absoluteTime: "2082-2-3 18:11", order: 159, heaven: "壬", earthly: "寅"),
        YearHeavenEarthlyData(absoluteTime: "2083-2-4 00:05", order: 160, heaven: "癸", earthly: "卯"),
        YearHeavenEarthlyData(absoluteTime: "2084-2-4 05:54", order: 161, heaven: "甲", earthly: "辰"),
        YearHeavenEarthlyData(absoluteTime: "2085-2-3 11:40", order: 162, heaven: "乙", earthly: "巳"),
        YearHeavenEarthlyData(absoluteTime: "2086-2-3 17:34", order: 163, heaven: "丙", earthly: "午"),
        YearHeavenEarthlyData(absoluteTime: "2087-2-3 23:20", order: 164, heaven: "丁", earthly: "未"),
        YearHeavenEarthlyData(absoluteTime: "2088-2-4 05:10", order: 165, heaven: "戊", earthly: "申"),
        YearHeavenEarthlyData(absoluteTime: "2089-2-3 11:03", order: 166, heaven: "己", earthly: "酉"),
        YearHeavenEarthlyData(absoluteTime: "2090-2-3 16:48", order: 167, heaven: "庚", earthly: "戌"),
        YearHeavenEarthlyData(absoluteTime: "2091-2-3 22:40", order: 168, heaven: "辛", earthly: "亥"),
        YearHeavenEarthlyData(absoluteTime: "2092-2-4 04:30", order: 169, heaven: "壬", earthly: "子"),
        YearHeavenEarthlyData(absoluteTime: "2093-2-3 10:16", order: 170, heaven: "癸", earthly: "丑"),
        YearHeavenEarthlyData(absoluteTime: "2094-2-3 16:10", order: 171, heaven: "甲", earthly: "寅"),
        YearHeavenEarthlyData(absoluteTime: "2095-2-3 21:57", order: 172, heaven: "乙", earthly: "卯"),
        YearHeavenEarthlyData(absoluteTime: "2096-2-4 03:45", order: 173, heaven: "丙", earthly: "辰"),
        YearHeavenEarthlyData(absoluteTime: "2097-2-3 09:39", order: 174, heaven: "丁", earthly: "巳"),
        YearHeavenEarthlyData(absoluteTime: "2098-2-3 15:24", order: 175, heaven: "戊", earthly: "午"),
        YearHeavenEarthlyData(absoluteTime: "2099-2-3 21:15", order: 176, heaven: "己", earthly: "未"),
        YearHeavenEarthlyData(absoluteTime: "2100-2-4 03:07", order: 177, heaven: "庚", earthly: "申")
    ]
    
    func timeStringToDate(inputTimeString dateStr: String) -> Date {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
                
        guard let date = dateFormatter.date(from: dateStr) else { return Date() }
        
        return date
        
    }
    
    func getBirthYearHeavenEarthly(inputDate date: Date) -> YearHeavenEarthlyData {
                
        for index in 0..<yearHeavenEarthlyData.count {
            
            let compareTime = timeStringToDate(inputTimeString: yearHeavenEarthlyData[index].absoluteTime)
            
            let compareResult = date.compare(compareTime)
            
            switch compareResult {
                
            case .orderedAscending:
                
                print("date 小於 compareTime")
                
                return yearHeavenEarthlyData[index-1]
                
            case .orderedDescending:
                
                print("date 大於 compareTime")
                
            default:
                
                print("date 等於 compareTime")
                
                return yearHeavenEarthlyData[index]
                
            }

        }
        
        return yearHeavenEarthlyData[0]
        
    }
    
}
