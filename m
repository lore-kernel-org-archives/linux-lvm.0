Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VGkTci011728
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 31 May 2016 12:46:29 -0400
Received: from smtp1.dds.nl (smtp1.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B0D6C05E16E
	for <linux-lvm@redhat.com>; Tue, 31 May 2016 16:46:27 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 28FC57F921
	for <linux-lvm@redhat.com>; Tue, 31 May 2016 18:46:24 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 31 May 2016 18:46:24 +0200
From: Xen <list@xenhideout.nl>
Message-ID: <569cd40b315e95ab1c72c0203b739cb9@dds.nl>
Subject: [linux-lvm] lvm cache monitoring attempt ;-)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux lvm <linux-lvm@redhat.com>

I am trying to understand the cache workings better.

To my dismay much of my current problems are actually caused by the SSD 
being a rather slow writer, and the fact that while working with data, 
most of it may end up in the cache, and if those blocks are then written 
to they will have to be updated on the cache.

I actually had an issue that the writing of data did not go down to 
cache speed (which is really low, about 14MB/s :-/) but it would stall 
for periods of time and not continue, I haven't seen data on that yet. I 
cannot identify it from the "cp" I have been doing.

I wrote a script to get some live data on cache performance, I don't 
know if that is the way to do it.

The basics of it were:

#!/bin/bash

while [ -d /proc/$1 ]; do
   vmstat -d | grep -e "dm-12\|dm-14\|dm-15" | tee -a out
   sleep 2s
done

Feed this script the process ID of the thing you want to monitor; ie. 
wait for its finishing.

Then another script can feed the thing into an acceptable output:

#!/bin/bash

rm -f *-parse
for f in dm-12 dm-14 dm-15; do

   cat out | grep $f > out-$f
   printf "        %-19s\n" $( ls -l /dev/mapper | grep $f | tr -s ' ' | 
cut -f9 -d' ' | sed 's/linux-//' ) > out-${f}-parse

   printf  "%4s %6s %8s %3s %3s\n" tot sector  ms cur sec >> 
out-${f}-parse
   cat out-$f | awk '{print $6 " " $8 " " $9 " " $10 " " $11}' | { old=( 
0 0 0 0 0 ); while read -a arr; do ms=$(( arr[2] - old[2] )); if [ $ms 
-gt 100 ]; then ms=$(( ms / 1000 )); fi; printf "%4d %6d %8d %3d %3d\n" 
$(( arr[0] - old[0] )) $(( arr[1] - old[1] )) $ms ${arr[3]} $(( arr[4] - 
old[4] )); old=( ${arr[@]} ); done; } | tail -n +2 >> out-${f}-parse
   done

paste *-parse

The only thing it does is select some fields. For each device the fields 
are put into an array. For most fields except that of the outstanding IO 
requests, the difference is calculated with the last line. So all 
numbers are deltas except the fourth field. If the "ms" field is greater 
than 100, it is divided by 1000 so you don't see these huge numbers. For 
some reason "delta milliseconds" can easily exceed a million, which 
would mean more than a 1000 seconds per second.

I have no clue; even if they are microseconds, these numbers have an 
average of about 5000000 per 2 seconds if writing takes place. The 
vmstat help says:

        ms: milliseconds spent reading
        ms: milliseconds spent writing

I'd have to dig in the source or whatever to see what it really is. 5 
seconds per 2 seconds is still a lot, etc.

Here is an example output:

         root_cache_cdata                  root_corig                     
     root
  tot sector       ms cur sec     tot sector       ms cur sec     tot 
sector       ms cur sec
  288  36864     4972   2   2       0      0        0   0   0      18  
36864      353   0   2
  320  40960     3648   2   2       0      0        0   0   0      20  
40960      224   0   2
    0      0     2904   1   2       0      0        0   0   0       0     
  0      192   0   2
  609  77824     6396   2   2       7     48       36   0   0      44  
77872      380   0   2
  320  40960     6852   1   2       0      0        0   0   0      20  
40960      441   0   2
  721  92160     6316   2   2       8     56       28   0   0      52  
92216      398   0   2
  353  45064     3285   2   3       0      0        0   0   0      23  
45064      206   0   2
    0      0      345   2   2       0      0        0   0   0       0     
  0       13   0   2
    0      0     3644   1   2       0      0        0   0   0       0     
  0      250   0   2
  337  43008     3288   1   2       7     48       44   0   0      27  
43056      202   0   2

<snip>

  271  34688     6591   1   2    2945 376960      359   1   1     201 
411648      443   0   2
    0      0     5673   1   2    1472 188416     2883   1   2      92 
188416      533   0   2
    1      0     3326   1   2    1482 188488     3614   0   2     101 
188488      411   0   2
    0      0     2812   1   2    2304 294912      908   1   2     144 
294912      263   0   2
    1      0     5454   0   2    1385 176192     2306   2   2      94 
176192      489   0   2
    0      0     2977   0   2    1088 139264     3834   2   2      68 
139264      412   0   2
    0      0     1386   0   2    1648 210944     3825   2   2     103 
210944      326   0   2
    1      0     6097   0   2     905 114752     4596   2   2      64 
114752      687   0   2

For cache_cdata and corig sectors per write is always 128 (max) which 
comes down to 64kB per write which makes sense.

On this output you can see that my corig is a much faster writer ;-).

In this output there was apparently no stalling; either the cache was 
writing, or the origin. Earlier I had issues when transfer rates would 
drop below 1M/s. Maybe it was caused by not having noatime?

I would have very long stalls and this was the reason for me to 
investigate this. A program like rsync (-aPh) or my own script would 
show abysmal rates for longer times. I would also have "ls" not 
responding for the longest time, or "rm -rf *" taking maybe 20 seconds 
to complete for a meagre 1.6GB. In one file.

And I still don't know what causes that. I'd have to do more rsyncs for 
example but also watch the vmstat -d output at the same time.

Which would probably mean having to add timestamps which is annoying; I 
don't have live output at this point.

You'd need "logtail" to obtain new input while still remembering the 
last line (previous one). Anyway.

Maybe this would allow me to troubleshoot the "hangs" I have 
experienced.

Regards.
