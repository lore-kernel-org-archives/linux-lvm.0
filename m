Date: Thu,  4 Oct 2001 03:06:34 -0400
Message-Id: <200110040306.AA78774484@netcentricnj.com>
Mime-Version: 1.0
From: "tim" <tdwebste@netcentricnj.com>
Subject: Re: [linux-lvm] What have I done!?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

---------- Original Message ----------------------------------
From: idsfa@visi.com
Reply-To: linux-lvm@sistina.com
Date:  Thu, 4 Oct 2001 00:44:25 -0500

>On Wed, Oct 03, 2001 at 10:54:21PM -0400, Jason A. Lixfeld wrote:
>
>> hdj: read_intr: error=0x04 { DriveStatusError }
>> hdj: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
>> hdj: read_intr: error=0x04 { DriveStatusError }
>> hdj: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
>> hdl: read_intr: error=0x04 { DriveStatusError }
>> hdl: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
>> hdl: read_intr: error=0x04 { DriveStatusError }
>> hdl: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
>
>Those are IDE driver errors.  Judging from the drive devices, you
>have quite a few ide controllers.  Did you compile in the drivers
>for all of them?  Some of the cards (and even some on-board chipsets)
>are NOT supported by default.  In particular, Promise & HiPoint
>cards require special kernel compile time options.
>
>What do you see in /proc/ide?
>
>Note that if you compiled the drivers as modules, those modules
>MUST be loaded BEFORE lvm is started.
>
>  Michael Kellen
>  $ fortune -m Kellen
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>

So far I have no problems with Promise & HiPoint kernel drivers. Please indicate your chipset, cpu and all compiled ide drivers. This will help to see a pattern here.

-Tim.
