Message-ID: <38510B2E.B01076F5@motorola.com>
Date: Fri, 10 Dec 1999 15:16:15 +0100
From: Lars Blaesing <lars.blaesing@motorola.com>
Reply-To: r28976@email.sps.mot.com
MIME-Version: 1.0
Subject: [linux-lvm] extend file system
Content-Type: multipart/alternative;
 boundary="------------CC06F0FB6A4E13B562001D96"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@msede.com" <linux-lvm@msede.com>


--------------CC06F0FB6A4E13B562001D96
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi all,

maybe a quick question:
I have installed and integrated the LVM for one vg (vg00) with two lv00,
lv01.
The capacity of vg00 is 4GB and lv00 were assigned 500 MB and lv01
1000MB.

If I now try to extend lv00  with lvextend, I need to renew the file
system on this
lv00 partion with mke2fs, to make the change valid (for example inside
df).
During this process all data are lost (sure).  My understanding of the
resize2fs utility
was that the resizing of a lv is dynamically and the data are not
removed. After the in-
stallation of the resize2fs utility, I was able to invoke it without
problems, but the
result was the same like lvextend.
I called, i.g. resize2fs -L+100 /dev/vg00/lv00, and the tool finished
with a hint to run
fsck on the partition. After this was done and a remount the size was
still the same like
before. After installing a new filesystem to the lv00 partition it was
increased, but the
data were also lost again.

Is there misunderstanding or am I not able to extend a lv without
loosing data?

Thanks and kind regards Lars



--------------CC06F0FB6A4E13B562001D96
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
Hi all,
<p>maybe a quick question:
<br>I&nbsp;have installed and integrated the LVM for one vg (vg00) with
two lv00, lv01.
<br>The capacity of vg00 is 4GB and lv00 were assigned 500 MB and lv01
1000MB.
<p>If I now try to extend lv00&nbsp; with lvextend, I need to renew the
file system on this
<br>lv00 partion with mke2fs, to make the change valid (for example inside
df).
<br>During this process all data are lost (sure).&nbsp; My understanding
of the resize2fs utility
<br>was that the resizing of a lv is dynamically and the data are not removed.
After the in-
<br>stallation of the resize2fs utility, I&nbsp;was able to invoke it without
problems, but the
<br>result was the same like lvextend.
<br>I&nbsp;called, i.g. resize2fs -L+100 /dev/vg00/lv00, and the tool finished
with a hint to run
<br>fsck on the partition. After this was done and a remount the size was
still the same like
<br>before. After installing a new filesystem to the lv00 partition it
was increased, but the
<br>data were also lost again.
<p>Is there misunderstanding or am I not able to extend a lv without loosing
data?
<p>Thanks and kind regards Lars
<pre></pre>
&nbsp;</html>

--------------CC06F0FB6A4E13B562001D96--
