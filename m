Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8CENKV06089
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2005 10:23:20 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8CENInK020488
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2005 10:23:19 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id B7A0C1F41B0
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2005 16:23:02 +0200 (CEST)
Message-ID: <43258F43.2000107@conterra.de>
Date: Mon, 12 Sep 2005 16:22:59 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] metadata format processing
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

I want to develop a tool to get a graphical representation of my LVM configuration.
I thought about parsing the output of lvm commands, or even using the C-API directly.
Unfortunately I did not found a way to enforce read only access when using the API.
All user space tools have to run as root and may modify/destroy my LVM. So I think
they are a bad choice to build any CGI-scripts upon. Finally I discovered the external
metadata format, which describes any aspects of my LVM in detail. After I even found
a parser for this syntax within the LVM libs, I was able to convert the metadata
into XML. Once having XML it should be possible to transfer any informations towards
HTML or SVG.

My very first try looks like this:


<?xml version="1.0" encoding="ISO-8859-1"?>
<lvm>
   <contents>Text Format Volume Group</contents>
   <version>1</version>
   <description>Created *after* executing &apos;lvextend /dev/raster/eglv -l 7452 /dev/sdg1&apos;</description>
   <creation_host>linux2</creation_host>
   <creation_time>1124130973</creation_time>
   <group name="raster">
     <id>6FmvZu-mLHD-AIQV-jnFu-hMUN-oTwe-X2zCRm</id>
     <seqno>54</seqno>
     <status>RESIZEABLE</status>
     <status>READ</status>
     <status>WRITE</status>
     <extent_size>65536</extent_size>
     <max_lv>255</max_lv>
     <max_pv>255</max_pv>
     <group name="physical_volumes">
       <group name="pv0">
         <id>ruo3gO-jHR7-QV3Z-rUa4-jYnF-GyAn-uUR3vA</id>
         <device>/dev/sde1</device>
         <status>ALLOCATABLE</status>
         <pe_start>384</pe_start>
         <pe_count>7452</pe_count>
       </group>
       <group name="pv1">
         <id>ARjpMz-A6iP-8x3t-7aCg-CCSH-kZpo-vt1KPD</id>
         <device>/dev/sdd1</device>
         <status>ALLOCATABLE</status>
         <pe_start>384</pe_start>
         <pe_count>7452</pe_count>
       </group>
     </group>
     <group name="logical_volumes">
       <group name="eglv">
         <id>ylp7ol-r6wT-e2Py-4KZ9-cgjU-6fU0-luciPx</id>
         <status>READ</status>
         <status>WRITE</status>
         <status>VISIBLE</status>
         <segment_count>1</segment_count>
         <group name="segment1">
           <start_extent>0</start_extent>
           <extent_count>7452</extent_count>
           <type>striped</type>
           <stripe_count>1</stripe_count>
           <stripes>pv0</stripes>
           <stripes>0</stripes>
         </group>
       </group>
     </group>
   </group>
</lvm>

I manually shortened it, just as an example...

I used the parser to get it into a "struct config_tree" and developed
some procedure to dump it out as XML. There are some aspects that can be
discussed (why are all nesting elements simply called <group> whereas
arrays are not grouped ...)

I'm just about to learn XSLT to get this processed further.

Is some one interested to participate?

Dieter.
-- 
Dieter St�ken, con terra GmbH, M�nster
     stueken@conterra.de
     http://www.conterra.de/
     (0)251-7474-501
