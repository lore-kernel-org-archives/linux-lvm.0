Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id qBKEuI42023463
	for <linux-lvm@redhat.com>; Thu, 20 Dec 2012 09:56:18 -0500
Received: from smtp.vs77100.net (smtp.vs77100.com [209.137.135.206])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qBKEuGYv006271
	for <linux-lvm@redhat.com>; Thu, 20 Dec 2012 09:56:16 -0500
Received: from localhost (scanner-1.xcade.net [172.17.0.59])
	by smtp.vs77100.net (Postfix) with ESMTP id 589DD4F982
	for <linux-lvm@redhat.com>; Thu, 20 Dec 2012 14:56:12 +0000 (UTC)
Received: from smtp.vs77100.net ([172.17.2.206])
	by localhost (scanner-th1.xcade.net [172.17.0.59]) (amavisd-new,
	port 10024) with ESMTP id HkbZaIRetl0h for <linux-lvm@redhat.com>;
	Thu, 20 Dec 2012 14:56:11 +0000 (UTC)
Received: from [172.20.10.149] (200-127-146-186.net.prima.net.ar
	[200.127.146.186])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.vs77100.net (Postfix) with ESMTPSA id 2E1814F982
	for <linux-lvm@redhat.com>; Thu, 20 Dec 2012 14:56:09 +0000 (UTC)
Message-ID: <50D32703.70307@avature.net>
Date: Thu, 20 Dec 2012 11:56:03 -0300
From: Guillermo Schulman <guillermos@avature.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problems with snapshot rollback
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
To: linux-lvm@redhat.com

Hi,
we are trying to use lvm to be able to use snapshots. Basically what we 
need to do is to take a snapshot of the data of our mysql DBs, perform 
some data modification statements on them and then rollback to the 
initial point. We need to repeat the process several times, for testing 
purposes. However, something is not working or, at least, something is 
behaving in a really weird way. Not sure if it's a bug or something 
we're not considering.

Here's what we actually do:
We have an Amazon server running ubuntu 12.04 64bits and we have three 
EBS disks 1TB each.
We built a LVM with those 3 disks and mounted there the mysql data.

This is how it looks with lvdisplay:
   --- Logical volume ---
   LV Name                /dev/vg0/mysql
   VG Name                vg0
   LV UUID                DOMf6L-Q25i-nU1F-LdKj-K4Be-arpB-oLJGQB
   LV Write Access        read/write
   LV Status              available
   # open                 1
   LV Size                800.00 GiB
   Current LE             204800
   Segments               2
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     256
   Block device           252:1

Then, we create the Snapshot in order to be able to get back to this 
point later:
# CREATE SNAPSHOT
# stop mysql in a clean way
echo "set global innodb_fast_shutdown=0" | mysql
service mysql stop
# create the snapshot
SNNAME=snmysql$(date +%Y%m%d%H%M%S)
echo $SNNAME > /tmp/snname.log
lvcreate -l100%FREE -s -n $SNNAME /dev/vg0/mysql

Now, lvdisplay adds this to the output:
   --- Logical volume ---
   LV Name                /dev/vg0/snmysql20121220132053
   VG Name                vg0
   LV UUID                lfOmbb-jC6D-r1fz-EvC7-ieMD-mL1S-lVxcRl
   LV Write Access        read/write
   LV snapshot status     active destination for /dev/vg0/mysql
   LV Status              available
   # open                 0
   LV Size                800.00 GiB
   Current LE             204800
   COW-table size         779.86 GiB
   COW-table LE           199644
   Allocated to snapshot  0.00%
   Snapshot chunk size    4.00 KiB
   Segments               3
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     256
   Block device           252:2

At this point, we perform a set of some simple data modifications with a 
bash script which is quite simple:
service mysql start

seq 10 | while read i; do
   echo "DROP DATABASE IF EXISTS db$i; CREATE DATABASE db$i" | mysql -uroot
   seq 100 | while read j; do
     echo "CREATE TABLE t$j (i integer not null auto_increment primary 
key)" | mysql -uroot db$i
     echo "INSERT INTO t$j values (1); INSERT INTO t$j values (2);" | 
mysql -uroot db$i
   done
done

Everything looks ok so far.
Then, we try to rollback the changes by "merging" the snapshot we had made:

# ROLLBACK SN
echo "set global innodb_fast_shutdown=0" | mysql
service mysql stop
umount /mnt/mysql
# get the snapshot name we had used
SNNAME=$(cat /tmp/snname.log)
lvconvert --merge /dev/vg0/$SNNAME

And here's where we start getting weird behaviours. The first time it 
usually runs ok:
   Merging of volume snmysql20121220132053 started.
   mysql: Merged: 0.0%
   mysql: Merged: 0.0%
   Merge of snapshot into logical volume mysql has finished.
   Logical volume "snmysql20121220132053" successfully removed

That's great and everything looks and works perfectly.
But, if we repeat the procedure (i.e. make the snapshot, modify data, 
rollback to snapshot), at some point (it could be the second, third or 
the Nth iteration) the lvconvert command starts beahving this way:


lvconvert --merge /dev/vg0/$SNNAME
   Merging of volume snmysql20121220133552 started.
   mysql: Merged: 0.0%
   mysql: Merged: 100.0%
   mysql: Merged: 100.0%
   mysql: Merged: 100.0%
   mysql: Merged: 100.0%
   mysql: Merged: 100.0%
   mysql: Merged: 100.0%
   mysql: Merged: 100.0%
   mysql: Merged: 100.0%

And it gets at that point repeating that 100.0% output forever. We can 
break it but, apparentely we can't break it as soon as it gets to 100% 
but a while later. Actually, we think that we could detect the moment by 
monitoring the situation using lvs. As long as lvs output looks like 
this, the status seems to be incomplete and we should not break it:

File descriptor 4 (pipe:[327994]) leaked on lvs invocation. Parent PID 
32243: sh
   /dev/dm-2: read failed after 0 of 4096 at 0: Input/output error
   LV    VG   Attr   LSize   Origin Snap%  Move Log Copy%  Convert
   apt   vg0  -wi-ao 100.00g
   mysql vg0  Owi-a- 800.00g          0.00

See the "Input/output error" legend. After some seconds, the lvs output 
looks like this:

File descriptor 4 (pipe:[325418]) leaked on lvs invocation. Parent PID 
32413: sh
   LV    VG   Attr   LSize   Origin Snap%  Move Log Copy%  Convert
   apt   vg0  -wi-ao 100.00g
   mysql vg0  -wi-a- 800.00g

At this point, it seems to be safe to break the lvconvert --merge process.

Is this a right behaviour? Is this expectable? Would it be ok to work 
that way, I mean, just break the lvconvert process once the lvs output 
looks ok? Wouldn't it be a dirty way to work with it?
Are we missing something?
Thanks in advance.
