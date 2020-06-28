//
//  YearHeavenEarthly.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/28.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation

struct YearHeavenEarthly {
    
    let absoluteTime: String
    
    let order: Int
    
    let heaven: String
    
    let earthly: String
    
}

class YearHeavenEarthlyData {
    
    static let shared: YearHeavenEarthlyData = YearHeavenEarthlyData()
    
    private init() {}
    
    let yearHeavenEarthlyData: [YearHeavenEarthly] = [
        YearHeavenEarthly(absoluteTime: "1924-02-05 09:52", order: 1, heaven: "甲", earthly: "子"),
        YearHeavenEarthly(absoluteTime: "1925-02-04 15:41", order: 2, heaven: "乙", earthly: "丑"),
        YearHeavenEarthly(absoluteTime: "1926-02-04 21:34", order: 3, heaven: "丙", earthly: "寅"),
        YearHeavenEarthly(absoluteTime: "1927-02-05 03:19", order: 4, heaven: "丁", earthly: "卯"),
        YearHeavenEarthly(absoluteTime: "1928-02-05 09:11", order: 5, heaven: "戊", earthly: "辰"),
        YearHeavenEarthly(absoluteTime: "1929-02-04 15:02", order: 6, heaven: "己", earthly: "巳"),
        YearHeavenEarthly(absoluteTime: "1930-02-04 20:47", order: 7, heaven: "庚", earthly: "午"),
        YearHeavenEarthly(absoluteTime: "1931-02-05 02:41", order: 8, heaven: "辛", earthly: "未"),
        YearHeavenEarthly(absoluteTime: "1932-02-05 08:29", order: 9, heaven: "壬", earthly: "申"),
        YearHeavenEarthly(absoluteTime: "1933-02-04 14:16", order: 10, heaven: "癸", earthly: "酉"),
        YearHeavenEarthly(absoluteTime: "1934-02-04 20:10", order: 11, heaven: "甲", earthly: "戌"),
        YearHeavenEarthly(absoluteTime: "1935-02-05 01:56", order: 12, heaven: "乙", earthly: "亥"),
        YearHeavenEarthly(absoluteTime: "1936-02-05 07:46", order: 13, heaven: "丙", earthly: "子"),
        YearHeavenEarthly(absoluteTime: "1937-02-04 13:39", order: 14, heaven: "丁", earthly: "丑"),
        YearHeavenEarthly(absoluteTime: "1938-02-04 19:23", order: 15, heaven: "戊", earthly: "寅"),
        YearHeavenEarthly(absoluteTime: "1939-02-05 01:16", order: 16, heaven: "己", earthly: "卯"),
        YearHeavenEarthly(absoluteTime: "1940-02-05 07:06", order: 17, heaven: "庚", earthly: "辰"),
        YearHeavenEarthly(absoluteTime: "1941-02-04 12:52", order: 18, heaven: "辛", earthly: "巳"),
        YearHeavenEarthly(absoluteTime: "1942-02-04 18:46", order: 19, heaven: "壬", earthly: "午"),
        YearHeavenEarthly(absoluteTime: "1943-02-05 00:33", order: 20, heaven: "癸", earthly: "未"),
        YearHeavenEarthly(absoluteTime: "1944-02-05 06:21", order: 21, heaven: "甲", earthly: "申"),
        YearHeavenEarthly(absoluteTime: "1945-02-04 12:15", order: 22, heaven: "乙", earthly: "酉"),
        YearHeavenEarthly(absoluteTime: "1946-02-04 18:00", order: 23, heaven: "丙", earthly: "戌"),
        YearHeavenEarthly(absoluteTime: "1947-02-04 23:51", order: 24, heaven: "丁", earthly: "亥"),
        YearHeavenEarthly(absoluteTime: "1948-02-05 05:43", order: 25, heaven: "戊", earthly: "子"),
        YearHeavenEarthly(absoluteTime: "1949-02-04 11:28", order: 26, heaven: "己", earthly: "丑"),
        YearHeavenEarthly(absoluteTime: "1950-02-04 17:21", order: 27, heaven: "庚", earthly: "寅"),
        YearHeavenEarthly(absoluteTime: "1951-02-04 23:10", order: 28, heaven: "辛", earthly: "卯"),
        YearHeavenEarthly(absoluteTime: "1952-02-05 04:57", order: 29, heaven: "壬", earthly: "辰"),
        YearHeavenEarthly(absoluteTime: "1953-02-04 10:51", order: 30, heaven: "癸", earthly: "巳"),
        YearHeavenEarthly(absoluteTime: "1954-02-04 16:37", order: 31, heaven: "甲", earthly: "午"),
        YearHeavenEarthly(absoluteTime: "1955-02-04 22:26", order: 32, heaven: "乙", earthly: "未"),
        YearHeavenEarthly(absoluteTime: "1956-02-05 04:19", order: 33, heaven: "丙", earthly: "申"),
        YearHeavenEarthly(absoluteTime: "1957-02-04 10:04", order: 34, heaven: "丁", earthly: "酉"),
        YearHeavenEarthly(absoluteTime: "1958-02-04 15:57", order: 35, heaven: "戊", earthly: "戌"),
        YearHeavenEarthly(absoluteTime: "1959-02-04 21:47", order: 36, heaven: "己", earthly: "亥"),
        YearHeavenEarthly(absoluteTime: "1960-02-05 03:32", order: 37, heaven: "庚", earthly: "子"),
        YearHeavenEarthly(absoluteTime: "1961-02-04 09:26", order: 38, heaven: "辛", earthly: "丑"),
        YearHeavenEarthly(absoluteTime: "1962-02-04 15:13", order: 39, heaven: "壬", earthly: "寅"),
        YearHeavenEarthly(absoluteTime: "1963-02-04 21:02", order: 40, heaven: "癸", earthly: "卯"),
        YearHeavenEarthly(absoluteTime: "1964-02-05 02:55", order: 41, heaven: "甲", earthly: "辰"),
        YearHeavenEarthly(absoluteTime: "1965-02-04 08:40", order: 42, heaven: "乙", earthly: "巳"),
        YearHeavenEarthly(absoluteTime: "1966-02-04 14:32", order: 43, heaven: "丙", earthly: "午"),
        YearHeavenEarthly(absoluteTime: "1967-02-04 20:23", order: 44, heaven: "丁", earthly: "未"),
        YearHeavenEarthly(absoluteTime: "1968-02-05 02:08", order: 45, heaven: "戊", earthly: "申"),
        YearHeavenEarthly(absoluteTime: "1969-02-04 08:02", order: 46, heaven: "己", earthly: "酉"),
        YearHeavenEarthly(absoluteTime: "1970-02-04 13:50", order: 47, heaven: "庚", earthly: "戌"),
        YearHeavenEarthly(absoluteTime: "1971-02-04 19:37", order: 48, heaven: "辛", earthly: "亥"),
        YearHeavenEarthly(absoluteTime: "1972-02-05 01:31", order: 49, heaven: "壬", earthly: "子"),
        YearHeavenEarthly(absoluteTime: "1973-02-04 07:17", order: 50, heaven: "癸", earthly: "丑"),
        YearHeavenEarthly(absoluteTime: "1974-02-04 13:07", order: 51, heaven: "甲", earthly: "寅"),
        YearHeavenEarthly(absoluteTime: "1975-02-04 19:00", order: 52, heaven: "乙", earthly: "卯"),
        YearHeavenEarthly(absoluteTime: "1976-02-05 00:45", order: 53, heaven: "丙", earthly: "辰"),
        YearHeavenEarthly(absoluteTime: "1977-02-04 06:37", order: 54, heaven: "丁", earthly: "巳"),
        YearHeavenEarthly(absoluteTime: "1978-02-04 12:27", order: 55, heaven: "戊", earthly: "午"),
        YearHeavenEarthly(absoluteTime: "1979-02-04 18:13", order: 56, heaven: "己", earthly: "未"),
        YearHeavenEarthly(absoluteTime: "1980-02-05 00:07", order: 57, heaven: "庚", earthly: "申"),
        YearHeavenEarthly(absoluteTime: "1981-02-04 05:54", order: 58, heaven: "辛", earthly: "酉"),
        YearHeavenEarthly(absoluteTime: "1982-02-04 11:42", order: 59, heaven: "壬", earthly: "戌"),
        YearHeavenEarthly(absoluteTime: "1983-02-04 17:36", order: 60, heaven: "癸", earthly: "亥"),
        YearHeavenEarthly(absoluteTime: "1984-02-04 23:21", order: 61, heaven: "甲", earthly: "子"),
        YearHeavenEarthly(absoluteTime: "1985-02-04 05:12", order: 62, heaven: "乙", earthly: "丑"),
        YearHeavenEarthly(absoluteTime: "1986-02-04 11:04", order: 63, heaven: "丙", earthly: "寅"),
        YearHeavenEarthly(absoluteTime: "1987-02-04 16:49", order: 64, heaven: "丁", earthly: "卯"),
        YearHeavenEarthly(absoluteTime: "1988-02-04 22:42", order: 65, heaven: "戊", earthly: "辰"),
        YearHeavenEarthly(absoluteTime: "1989-02-04 04:31", order: 66, heaven: "己", earthly: "巳"),
        YearHeavenEarthly(absoluteTime: "1990-02-04 10:18", order: 67, heaven: "庚", earthly: "午"),
        YearHeavenEarthly(absoluteTime: "1991-02-04 16:12", order: 68, heaven: "辛", earthly: "未"),
        YearHeavenEarthly(absoluteTime: "1992-02-04 21:58", order: 69, heaven: "壬", earthly: "申"),
        YearHeavenEarthly(absoluteTime: "1993-02-04 03:47", order: 70, heaven: "癸", earthly: "酉"),
        YearHeavenEarthly(absoluteTime: "1994-02-04 09:40", order: 71, heaven: "甲", earthly: "戌"),
        YearHeavenEarthly(absoluteTime: "1995-02-04 15:25", order: 72, heaven: "乙", earthly: "亥"),
        YearHeavenEarthly(absoluteTime: "1996-02-04 21:18", order: 73, heaven: "丙", earthly: "子"),
        YearHeavenEarthly(absoluteTime: "1997-02-04 03:08", order: 74, heaven: "丁", earthly: "丑"),
        YearHeavenEarthly(absoluteTime: "1998-02-04 08:53", order: 75, heaven: "戊", earthly: "寅"),
        YearHeavenEarthly(absoluteTime: "1999-02-04 14:47", order: 76, heaven: "己", earthly: "卯"),
        YearHeavenEarthly(absoluteTime: "2000-02-04 20:35", order: 77, heaven: "庚", earthly: "辰"),
        YearHeavenEarthly(absoluteTime: "2001-02-04 02:23", order: 78, heaven: "辛", earthly: "巳"),
        YearHeavenEarthly(absoluteTime: "2002-02-04 08:16", order: 79, heaven: "壬", earthly: "午"),
        YearHeavenEarthly(absoluteTime: "2003-02-04 14:02", order: 80, heaven: "癸", earthly: "未"),
        YearHeavenEarthly(absoluteTime: "2004-02-04 19:53", order: 81, heaven: "甲", earthly: "申"),
        YearHeavenEarthly(absoluteTime: "2005-02-04 01:44", order: 82, heaven: "乙", earthly: "酉"),
        YearHeavenEarthly(absoluteTime: "2006-02-04 07:29", order: 83, heaven: "丙", earthly: "戌"),
        YearHeavenEarthly(absoluteTime: "2007-02-04 13:23", order: 84, heaven: "丁", earthly: "亥"),
        YearHeavenEarthly(absoluteTime: "2008-02-04 19:11", order: 85, heaven: "戊", earthly: "子"),
        YearHeavenEarthly(absoluteTime: "2009-02-04 00:58", order: 86, heaven: "己", earthly: "丑"),
        YearHeavenEarthly(absoluteTime: "2010-02-04 06:52", order: 87, heaven: "庚", earthly: "寅"),
        YearHeavenEarthly(absoluteTime: "2011-02-04 12:38", order: 88, heaven: "辛", earthly: "卯"),
        YearHeavenEarthly(absoluteTime: "2012-02-04 18:28", order: 89, heaven: "壬", earthly: "辰"),
        YearHeavenEarthly(absoluteTime: "2013-02-04 00:21", order: 90, heaven: "癸", earthly: "巳"),
        YearHeavenEarthly(absoluteTime: "2014-02-04 06:06", order: 91, heaven: "甲", earthly: "午"),
        YearHeavenEarthly(absoluteTime: "2015-02-04 11:58", order: 92, heaven: "乙", earthly: "未"),
        YearHeavenEarthly(absoluteTime: "2016-02-04 17:48", order: 93, heaven: "丙", earthly: "申"),
        YearHeavenEarthly(absoluteTime: "2017-02-03 23:34", order: 94, heaven: "丁", earthly: "酉"),
        YearHeavenEarthly(absoluteTime: "2018-02-04 05:28", order: 95, heaven: "戊", earthly: "戌"),
        YearHeavenEarthly(absoluteTime: "2019-02-04 11:15", order: 96, heaven: "己", earthly: "亥"),
        YearHeavenEarthly(absoluteTime: "2020-02-04 17:03", order: 97, heaven: "庚", earthly: "子"),
        YearHeavenEarthly(absoluteTime: "2021-02-03 22:57", order: 98, heaven: "辛", earthly: "丑"),
        YearHeavenEarthly(absoluteTime: "2022-02-04 04:42", order: 99, heaven: "壬", earthly: "寅"),
        YearHeavenEarthly(absoluteTime: "2023-02-04 10:33", order: 100, heaven: "癸", earthly: "卯"),
        YearHeavenEarthly(absoluteTime: "2024-02-04 16:25", order: 101, heaven: "甲", earthly: "辰"),
        YearHeavenEarthly(absoluteTime: "2025-02-03 22:10", order: 102, heaven: "乙", earthly: "巳"),
        YearHeavenEarthly(absoluteTime: "2026-02-04 04:03", order: 103, heaven: "丙", earthly: "午"),
        YearHeavenEarthly(absoluteTime: "2027-02-04 09:52", order: 104, heaven: "丁", earthly: "未"),
        YearHeavenEarthly(absoluteTime: "2028-02-04 15:39", order: 105, heaven: "戊", earthly: "申"),
        YearHeavenEarthly(absoluteTime: "2029-02-03 21:33", order: 106, heaven: "己", earthly: "酉"),
        YearHeavenEarthly(absoluteTime: "2030-02-04 03:19", order: 107, heaven: "庚", earthly: "戌"),
        YearHeavenEarthly(absoluteTime: "2031-02-04 09:08", order: 108, heaven: "辛", earthly: "亥"),
        YearHeavenEarthly(absoluteTime: "2032-02-04 15:01", order: 109, heaven: "壬", earthly: "子"),
        YearHeavenEarthly(absoluteTime: "2033-02-03 20:46", order: 110, heaven: "癸", earthly: "丑"),
        YearHeavenEarthly(absoluteTime: "2034-02-04 02:38", order: 111, heaven: "甲", earthly: "寅"),
        YearHeavenEarthly(absoluteTime: "2035-02-04 08:29", order: 112, heaven: "乙", earthly: "卯"),
        YearHeavenEarthly(absoluteTime: "2036-02-04 14:14", order: 113, heaven: "丙", earthly: "辰"),
        YearHeavenEarthly(absoluteTime: "2037-02-03 20:08", order: 114, heaven: "丁", earthly: "巳"),
        YearHeavenEarthly(absoluteTime: "2038-02-04 01:56", order: 115, heaven: "戊", earthly: "午"),
        YearHeavenEarthly(absoluteTime: "2039-02-04 07:44", order: 116, heaven: "己", earthly: "未"),
        YearHeavenEarthly(absoluteTime: "2040-02-04 13:37", order: 117, heaven: "庚", earthly: "申"),
        YearHeavenEarthly(absoluteTime: "2041-02-03 19:23", order: 118, heaven: "辛", earthly: "酉"),
        YearHeavenEarthly(absoluteTime: "2042-02-04 01:14", order: 119, heaven: "壬", earthly: "戌"),
        YearHeavenEarthly(absoluteTime: "2043-02-04 07:05", order: 120, heaven: "癸", earthly: "亥"),
        YearHeavenEarthly(absoluteTime: "2044-02-04 12:50", order: 121, heaven: "甲", earthly: "子"),
        YearHeavenEarthly(absoluteTime: "2045-02-03 18:44", order: 122, heaven: "乙", earthly: "丑"),
        YearHeavenEarthly(absoluteTime: "2046-02-04 00:33", order: 123, heaven: "丙", earthly: "寅"),
        YearHeavenEarthly(absoluteTime: "2047-02-04 06:19", order: 124, heaven: "丁", earthly: "卯"),
        YearHeavenEarthly(absoluteTime: "2048-02-04 12:13", order: 125, heaven: "戊", earthly: "辰"),
        YearHeavenEarthly(absoluteTime: "2049-02-03 17:59", order: 126, heaven: "己", earthly: "巳"),
        YearHeavenEarthly(absoluteTime: "2050-02-03 23:49", order: 127, heaven: "庚", earthly: "午"),
        YearHeavenEarthly(absoluteTime: "2051-02-04 05:42", order: 128, heaven: "辛", earthly: "未"),
        YearHeavenEarthly(absoluteTime: "2052-02-04 11:27", order: 129, heaven: "壬", earthly: "申"),
        YearHeavenEarthly(absoluteTime: "2053-02-03 17:19", order: 130, heaven: "癸", earthly: "酉"),
        YearHeavenEarthly(absoluteTime: "2054-02-03 23:09", order: 131, heaven: "甲", earthly: "戌"),
        YearHeavenEarthly(absoluteTime: "2055-02-04 04:55", order: 132, heaven: "乙", earthly: "亥"),
        YearHeavenEarthly(absoluteTime: "2056-02-04 10:49", order: 133, heaven: "丙", earthly: "子"),
        YearHeavenEarthly(absoluteTime: "2057-02-03 16:36", order: 134, heaven: "丁", earthly: "丑"),
        YearHeavenEarthly(absoluteTime: "2058-02-03 22:24", order: 135, heaven: "戊", earthly: "寅"),
        YearHeavenEarthly(absoluteTime: "2059-02-04 04:18", order: 136, heaven: "己", earthly: "卯"),
        YearHeavenEarthly(absoluteTime: "2060-02-04 10:03", order: 137, heaven: "庚", earthly: "辰"),
        YearHeavenEarthly(absoluteTime: "2061-02-03 15:54", order: 138, heaven: "辛", earthly: "巳"),
        YearHeavenEarthly(absoluteTime: "2062-02-03 21:46", order: 139, heaven: "壬", earthly: "午"),
        YearHeavenEarthly(absoluteTime: "2063-02-04 03:31", order: 140, heaven: "癸", earthly: "未"),
        YearHeavenEarthly(absoluteTime: "2064-02-04 09:24", order: 141, heaven: "甲", earthly: "申"),
        YearHeavenEarthly(absoluteTime: "2065-02-03 15:13", order: 142, heaven: "乙", earthly: "酉"),
        YearHeavenEarthly(absoluteTime: "2066-02-03 21:00", order: 143, heaven: "丙", earthly: "戌"),
        YearHeavenEarthly(absoluteTime: "2067-02-04 02:54", order: 144, heaven: "丁", earthly: "亥"),
        YearHeavenEarthly(absoluteTime: "2068-02-04 08:40", order: 145, heaven: "戊", earthly: "子"),
        YearHeavenEarthly(absoluteTime: "2069-02-03 14:29", order: 146, heaven: "己", earthly: "丑"),
        YearHeavenEarthly(absoluteTime: "2070-02-03 20:22", order: 147, heaven: "庚", earthly: "寅"),
        YearHeavenEarthly(absoluteTime: "2071-02-04 02:07", order: 148, heaven: "辛", earthly: "卯"),
        YearHeavenEarthly(absoluteTime: "2072-02-04 07:59", order: 149, heaven: "壬", earthly: "辰"),
        YearHeavenEarthly(absoluteTime: "2073-02-03 13:50", order: 150, heaven: "癸", earthly: "巳"),
        YearHeavenEarthly(absoluteTime: "2074-02-03 19:35", order: 151, heaven: "甲", earthly: "午"),
        YearHeavenEarthly(absoluteTime: "2075-02-04 01:29", order: 152, heaven: "乙", earthly: "未"),
        YearHeavenEarthly(absoluteTime: "2076-02-04 07:17", order: 153, heaven: "丙", earthly: "申"),
        YearHeavenEarthly(absoluteTime: "2077-02-03 13:05", order: 154, heaven: "丁", earthly: "酉"),
        YearHeavenEarthly(absoluteTime: "2078-02-03 18:58", order: 155, heaven: "戊", earthly: "戌"),
        YearHeavenEarthly(absoluteTime: "2079-02-04 00:44", order: 156, heaven: "己", earthly: "亥"),
        YearHeavenEarthly(absoluteTime: "2080-02-04 06:35", order: 157, heaven: "庚", earthly: "子"),
        YearHeavenEarthly(absoluteTime: "2081-02-03 12:26", order: 158, heaven: "辛", earthly: "丑"),
        YearHeavenEarthly(absoluteTime: "2082-02-03 18:11", order: 159, heaven: "壬", earthly: "寅"),
        YearHeavenEarthly(absoluteTime: "2083-02-04 00:05", order: 160, heaven: "癸", earthly: "卯"),
        YearHeavenEarthly(absoluteTime: "2084-02-04 05:54", order: 161, heaven: "甲", earthly: "辰"),
        YearHeavenEarthly(absoluteTime: "2085-02-03 11:40", order: 162, heaven: "乙", earthly: "巳"),
        YearHeavenEarthly(absoluteTime: "2086-02-03 17:34", order: 163, heaven: "丙", earthly: "午"),
        YearHeavenEarthly(absoluteTime: "2087-02-03 23:20", order: 164, heaven: "丁", earthly: "未"),
        YearHeavenEarthly(absoluteTime: "2088-02-04 05:10", order: 165, heaven: "戊", earthly: "申"),
        YearHeavenEarthly(absoluteTime: "2089-02-03 11:03", order: 166, heaven: "己", earthly: "酉"),
        YearHeavenEarthly(absoluteTime: "2090-02-03 16:48", order: 167, heaven: "庚", earthly: "戌"),
        YearHeavenEarthly(absoluteTime: "2091-02-03 22:40", order: 168, heaven: "辛", earthly: "亥"),
        YearHeavenEarthly(absoluteTime: "2092-02-04 04:30", order: 169, heaven: "壬", earthly: "子"),
        YearHeavenEarthly(absoluteTime: "2093-02-03 10:16", order: 170, heaven: "癸", earthly: "丑"),
        YearHeavenEarthly(absoluteTime: "2094-02-03 16:10", order: 171, heaven: "甲", earthly: "寅"),
        YearHeavenEarthly(absoluteTime: "2095-02-03 21:57", order: 172, heaven: "乙", earthly: "卯"),
        YearHeavenEarthly(absoluteTime: "2096-02-04 03:45", order: 173, heaven: "丙", earthly: "辰"),
        YearHeavenEarthly(absoluteTime: "2097-02-03 09:39", order: 174, heaven: "丁", earthly: "巳"),
        YearHeavenEarthly(absoluteTime: "2098-02-03 15:24", order: 175, heaven: "戊", earthly: "午"),
        YearHeavenEarthly(absoluteTime: "2099-02-03 21:15", order: 176, heaven: "己", earthly: "未"),
        YearHeavenEarthly(absoluteTime: "2100-02-04 03:07", order: 177, heaven: "庚", earthly: "申")
    ]
    
    func timeStringToDate(inputTimeString dateStr: String) -> Date {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        guard let date = dateFormatter.date(from: dateStr) else { return Date() }
        
        return date
        
    }
    
    func getBirthYearHeavenEarthly(inputDate date: Date) -> YearHeavenEarthly {
                
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

