From: Herbert =?iso-8859-1?Q?P=F6tzl?= <herbert@13thfloor.at>
Subject: Re: [linux-lvm] Poor performance with LVM 1.0.7
Message-ID: <20030827115857.GE23955@www.13thfloor.at>
References: <000e01c36bf9$e5f82720$6402000a@gasaraki>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000e01c36bf9$e5f82720$6402000a@gasaraki>
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
Date: Wed Aug 27 07:00:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henric Andersson <ha@thedudes.nu>
Cc: linux-lvm@sistina.com

On Tue, Aug 26, 2003 at 07:45:54PM +0200, Henric Andersson wrote:
> Hi all!
> 
> I've recently upgraded my poor little fileserver from an old P120 Classic to
> a brandspanking new Celeron 2Ghz with 512MB DDR memory. By doing this, I
> expected the performance of my fileserver to increase, giving me a total of
> 9,5MB/s when using samba.
> 
> And it did. But not when LVM is concerned :(
> 
> I have a VG setup with 3 drives (120GB each, not striped) which contains one
> LV running an ext3 filesystem.
> At first, I blamed my promise controllers (PDC 20269, ATA/133) but after
> some serious testing, I found that whenever I didn't access files that was
> stored on the LV, my speed was about 9.5MB/s, but when I transfered the same
> file from the LV, I only got about half of it (4.2MB/s). The file I
> transfered was roughly about 700-800MB big (same file used in all tests).

check the raw performance of one drive involved
with hdparm -tT ...

> After scouring the net for suggestions on how to improve the speed, I came
> up empty, and thus, I'm writing this email :)
> 
> Some more facts (more available if needed ;)) about the server:
> 
> All drives are tuned with 32bit transfers and DMA enabled. I'm running
> kernel 2.4.22pre2 (gentoo).

just for the fun of doing it, compile vanilla
2.4.22 and give it a try ... you could also add
the following lvm patch ...
http://www.13thfloor.at/VServer/patches-2.4.22-p10c17/07_lvm-1.0.7-2.4.21pre5.patch.bz2

> CPU usage is low (around 10-25%) when transfering files, so it does not seem
> to be the bottleneck.
> 
> Any suggestions and/or ideas are welcomed...

was the performance you had on your old box higher?
or did you just expect an increase in speed, which didn't
happen?

best,
Herbert


> /Henric
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
