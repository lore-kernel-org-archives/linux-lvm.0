From: Anders Widman <andewid@tnonline.net>
In-Reply-To: <Pine.GSO.4.21.0202061343080.17353-100000@psasolar.private.psa.pencom.com>
Message-Id: <3YZU4ZCA1Z2YG72C3276A7F0MLTRF0.3c619374@kadzuki>
Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
MIME-Version: 1.0
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
Date: Wed Feb  6 14:35:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Well, have you ever heard of diskcabbinettes? I use them alot wich means I don't have to have 10 disks in the same coputer at the same time. Then what, hot swap? Well this is very much possible, and secure 
(look at Promise.com).

IDE disk drives are very cheap and fast enough (Maxtor 160GB has a write performance of about 35MB/s in average) for most purposes and does not require special hardware or software.

//Anders

2002-02-06 20:45:42, James Mello <kingjamm@colltech.com> wrote:

>With your argument, were would you stick 10 IDE drives then? Add the cost
>of controllers, etc and you start to add more and more cost. The deal is,
>backups to tape are done to tape when the media cost savings justify the
>outlay of cash for the hardware. Like it was said before, most small
>business could get away with burning a CD. But what you *can't* do is
>ignore the fact that if you want to be safe, you *must* do backups. Disk
>is cool, but make sure that you fully account for the expense in your
>environment.
>
>	-- Cheers
>	-- James
>
>> Ben,
>> 	I think you missed a very important aspect.  The actual investment of
>> the tape drives.  A SDLT or LTO drive is going to run from about $4000
>> on up.  According to datacomm warehouse, a HP 230 external LTO drives
>> runs $3700.  An SDLT drive runs $4300.  You can't compare just the media
>> costs with that of the drive.  Let's consider a 1TB of data.
>> 
>> SDLT:
>> $4300 + (10 tapes * $50) = $4800
>> 
>> LTO:
>> $3700 + (10 tapes * $130) = $5000
>> 
>> AIT2:
>> $2800 + (20 tapes * $90) = $4600
>> 
>> IDE:
>> 10  Drives * 270 = $2700
>> 
>> DDS4:
>> $900 + (50 tapes * $24) = $2100
>> 
>> >From these numbers (using DataComm Warehouse pricing), you can see that
>> to backup 1TB, the IDE drives are actually the second cheapest.  And
>> from a raw performance point of view, they far exceed all the other
>> alternatives from a random access standpoint, and they are comparable to
>> even LTO from a transfer rate point of view.
>> 
>> Sorry... had to address this point.
>> 
>> On Wed, 2002-02-06 at 13:14, Benjamin Scott wrote:
>> >   Here are some prices from a recent Datacomm Warehouse catalog:
>> > 
>> >   Item            GB   Cost  $/GB
>> >   --------------  ---  ----  ----
>> >   IDE HDD         100   270  2.70
>> >   AIT2             50    90  1.80
>> >   SuperDLT        110   150  1.36
>> >   LTO Ultrium     100   130  1.30
>> >   DDS-4            20    24  1.20
>> > 
>> >   As you can see, hard disk is actually the most expensive media, not the
>> > least.  This whole "hard disks are cheaper" thing is a myth propagated by
>> > people who have never actually looked at the numbers.
>> 
>> 
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
>
