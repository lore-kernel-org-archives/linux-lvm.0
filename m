Message-ID: <3C03CEB1.E5D5D447@berbee.com>
From: Scott P <pichelma@berbee.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------ABC7688C998CC7E3152D6DFE"
Subject: [linux-lvm] LVM limit on PE's/size?
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Nov 27 11:35:01 2001
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

--------------ABC7688C998CC7E3152D6DFE
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi all...

I hope I'm not asking a too pettty of a question for this list!

We are planning to add a 3 rd EXP300 array to out current server w/ 2
EXP300's in place already!
We WILL surpass the 1 TB size, if possible?

A little history:

Linux ptb3 2.2.19 #2 SMP Tue Jul 24 11:53:29 CDT 2001 i686 unknown

I have two IBM EXP300 RAID arrays connected to a Netfinity 4500R running
Redhat Linux 6.2.
LVM compiled into kernel AFAIK...w/ patch?

We are using:
lvm_0.9.1_beta7
reiserfsprogs-3.x.0j

Here is the current filesystem and size:

/dev/exp300_2/exp300_lv2 924160464 891307744  32852720      97% /files1

Just wondering about this faq:

                           Q:
                               Why are my logical volumes limited to 256
GB in size?
                           A:
                               This is NO absolute limit but it depends
on the physical extent size you configured at volume group
                               creation time.

                               Please use option -s of the vgcreate
command to give a larger physical extent size. For example with a
                               physical extent size of 524288 KB (512
MB) you are able to map a logical volume of 32 Terabyte.
                               Remember that current Linux kernels are
limited to 1 Terabyte.

***Especially about the part in bold!

Please let me know if you need more details,  I will supply asap!

TIA!

-Scott





--------------ABC7688C998CC7E3152D6DFE
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
Hi all...
<p>I hope I'm not asking a too pettty of a question for this list!
<p>We are planning to add a 3 rd EXP300 array to out current server w/
2 EXP300's in place already!
<br>We WILL surpass the 1 TB&nbsp;size, if possible?
<p>A little history:
<p>Linux ptb3 2.2.19 #2 SMP Tue Jul 24 11:53:29 CDT 2001 i686 unknown
<p>I have two IBM EXP300 RAID&nbsp;arrays connected to a Netfinity 4500R&nbsp;running
Redhat Linux 6.2.
<br>LVM compiled into kernel AFAIK...w/ patch?
<p>We are using:
<br>lvm_0.9.1_beta7
<br>reiserfsprogs-3.x.0j
<p>Here is the current filesystem and size:
<p>/dev/exp300_2/exp300_lv2 924160464 891307744&nbsp; 32852720&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
97% /files1
<p>Just wondering about this faq:
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Q:
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Why are my logical volumes limited to 256 GB in size?
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
A:
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
This is NO absolute limit but it depends on the physical extent size you
configured at volume group
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
creation time.
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Please use option -s of the vgcreate command to give a larger physical
extent size. For example with a
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
physical extent size of 524288 KB (512 MB) you are able to map a logical
volume of 32 Terabyte.
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>
Remember that current Linux kernels are limited to 1 Terabyte.</b><b></b>
<p><b>***Especially about the part in bold!</b><b></b>
<p>Please let me know if you need more details,&nbsp; I will supply asap!
<p>TIA!
<p>-Scott
<br>&nbsp;
<br><b></b>&nbsp;
<br><b></b>&nbsp;
<br>&nbsp;</html>

--------------ABC7688C998CC7E3152D6DFE--
