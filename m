Message-ID: <3B8EC633.40202@st-peter.stw.uni-erlangen.de>
Date: Fri, 31 Aug 2001 01:03:15 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
References: <3B8E3F0E.8050609@st-peter.stw.uni-erlangen.de> <20010830083546.A20989@sistina.com>
Content-Type: multipart/alternative;
 boundary="------------050104020401070009030603"
Subject: [linux-lvm] Re: HELP changing md-device's partition-type to LVM
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
List-Id: <linux-lvm.redhat.com>
To: AJ Lewis <lewis@sistina.com>, linux-lvm@sistina.com

--------------050104020401070009030603
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi i couldn't change the partition's id of the RAID but i mannaged it to 
create the VG, LV and to format the LV
but when i try to mount the the LV mount segfaults  and every try to do 
anything with the LV finish witth a sleep
i mean when i try to mount anything ( a partition, a CD or a LV) after 
the segfault of the first ' mount -t xfs /dev/myData/Music /mnt/music ' 
 mount goes to sleep and do not do anything
vgdisplay says that the volume is activ
lvremove says that the volume is open and can not be removed 
do you have an idea wthat is the problem
and what can i try

the LV ( lvcreate -i3 -I4 -L26G -nMusic )

the VG -> myData   /dev/hdh10 /dev/md6 /dev/md7

/dev/hdh10 normal partition 14G
/dev/md6 ->  linear software RAID 14G /dev/hde6 /dev/hde12
/dev/md7 ->  linear software RAID 14G /dev/hdg1 /dev/hdg5 /dev/hdg6 
/dev/hdg12

the reason:

after trying BeOS, FreeBSD and useing windows , i was trying to switch 
complete to linux without having to repartiton all the drives( i have tree )
and lose about 30G of Data + and a new instalation ( the current Data 
and instalation is over a software RAID-0 other a striped  LV's  or to 
back up 30 Gigs of Data
AJ Lewis wrote:

>On Thu, Aug 30, 2001 at 03:26:38PM +0200, svetljo wrote:
>
>>Hi i saw your postings on the lvm-board
>>and i was woundering whether you can help me
>>
>>can you plese tell me how can i change the type  of  'partition' on 
>>md-device (softweare Linear RAID )
>>i can not make it with fdisk on md-device
>>
>>i have 3 disks with a lot of partitions and i wanted to build  striped 
>>LV's on a new VG
>>i've created the VG ( /dev/md5 /dev/md6 /dev/hdh10 )
>>but when i try to create LV's  it returns to me that not all PV's are 
>>online ( md5 )
>>and /proc/mdstat tells me that everything is ok :
>> md5 ( /dev/hde6 /dev/hde12 linear) and md6 (/dev/hdg1 /dev/hdg2 
>>/dev/hdg8 linear) are online
>>but they are marked as ext2 partitions
>>
>>can you please help me
>>
>
>I'm sorry.  I don't personally have any experience using md.  I suggest you
>post this to linux-lvm.  There should be people there that have done what
>you're proposing.
>
>>linux-2.4.9-xfs-cvs  with LVM 1.0.1rc1
>>
>
>Regards,
>



--------------050104020401070009030603
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<html>
<head>
</head>
<body>
Hi i couldn't change the partition's id of the RAID but i mannaged it to
create the VG, LV and to format the LV<br>
but when i try to mount the the LV mount segfaults &nbsp;and every try to do anything
with the LV finish witth a sleep<br>
i mean when i try to mount anything ( a partition, a CD or a LV) after the
segfault of the first ' mount -t xfs /dev/myData/Music /mnt/music ' &nbsp;mount
goes to sleep and do not do anything<br>
vgdisplay says that the volume is activ<br>
lvremove says that the volume is open and can not be removed&nbsp; <br>
do you have an idea wthat is the problem<br>
and what can i try<br>
<br>
the LV ( lvcreate -i3 -I4 -L26G -nMusic ) <br>
<br>
the VG -&gt; myData &nbsp; /dev/hdh10 /dev/md6 /dev/md7<br>
<br>
/dev/hdh10 normal partition 14G<br>
/dev/md6 -&gt; &nbsp;linear software RAID 14G /dev/hde6 /dev/hde12 <br>
/dev/md7 -&gt; &nbsp;linear software RAID 14G /dev/hdg1 /dev/hdg5 /dev/hdg6 /dev/hdg12<br>
<br>
the reason:<br>
<br>
after trying BeOS, FreeBSD and useing windows , i was trying to switch complete
to linux without having to repartiton all the drives( i have tree )<br>
and lose about 30G of Data + and a new instalation ( the current Data and
instalation is over a software RAID-0 other a striped &nbsp;LV's &nbsp;or to back up
30 Gigs of Data<br>
AJ Lewis wrote:<br>
<blockquote type="cite" cite="mid:20010830083546.A20989@sistina.com">
  <pre wrap="">On Thu, Aug 30, 2001 at 03:26:38PM +0200, svetljo wrote:<br></pre>
  <blockquote type="cite">
    <pre wrap="">Hi i saw your postings on the lvm-board<br>and i was woundering whether you can help me<br><br>can you plese tell me how can i change the type  of  'partition' on <br>md-device (softweare Linear RAID )<br>i can not make it with fdisk on md-device<br><br>i have 3 disks with a lot of partitions and i wanted to build  striped <br>LV's on a new VG<br>i've created the VG ( /dev/md5 /dev/md6 /dev/hdh10 )<br>but when i try to create LV's  it returns to me that not all PV's are <br>online ( md5 )<br>and /proc/mdstat tells me that everything is ok :<br> md5 ( /dev/hde6 /dev/hde12 linear) and md6 (/dev/hdg1 /dev/hdg2 <br>/dev/hdg8 linear) are online<br>but they are marked as ext2 partitions<br><br>can you please help me<br></pre>
    </blockquote>
    <pre wrap=""><!----><br>I'm sorry.  I don't personally have any experience using md.  I suggest you<br>post this to linux-lvm.  There should be people there that have done what<br>you're proposing.<br><br></pre>
    <blockquote type="cite">
      <pre wrap="">linux-2.4.9-xfs-cvs  with LVM 1.0.1rc1<br><br></pre>
      </blockquote>
      <pre wrap=""><!----><br>Regards,<br></pre>
      </blockquote>
      <br>
      <br>
      </body>
      </html>

--------------050104020401070009030603--
