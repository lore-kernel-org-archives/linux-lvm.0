Return-Path: <pwk.linuxfan@gmx.de>
From: Peter Kirk <pwk.linuxfan@gmx.de>
Subject: Re: System goes very slow (was: Re: [linux-lvm] Test of LVM)
Date: Sun, 27 May 2001 15:33:32 +0200
References: <01052614354500.00527@notch> <01052704562400.02599@notch> <3B10B023.E140C22E@loria.fr>
In-Reply-To: <3B10B023.E140C22E@loria.fr>
MIME-Version: 1.0
Message-Id: <01052715333200.00595@notch>
Content-Transfer-Encoding: 8bit
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
To: linux-lvm@sistina.com

Am Sonntag, 27. Mai 2001 09:43 schrieben Sie:
> > root@notch:/home/pwk > bonnie -s 1024MB
> > Bonnie 1.2: File './Bonnie.2815', size: 1073741824, volumes: 1
> > Writing with putc()...          done:   3270 kB/s  35.4 %CPU
> > Rewriting...                    done:   1505 kB/s  19.3 %CPU
> > Writing intelligently...        done:   4682 kB/s  11.4 %CPU
> > [I stopped bonnie here, do you need more output ?]
>
> Is DMA set on your harddrive ? (hdparm)
>
> DL
Yes I thought it was enabled, until I checked. hda had it enabled, and hdb 
had not :-(
Here is the new bonnie

root@notch:/home/pwk > bonnie -s 512
Bonnie 1.2: File './Bonnie.651', size: 536870912, volumes: 1
Writing with putc()...         	done:  13874 kB/s  98.1 %CPU
Rewriting...                   	done:  10629 kB/s   6.0 %CPU
Writing intelligently...       	done: 107497 kB/s  93.1 %CPU
Reading with getc()...         	done:  11554 kB/s  75.6 %CPU
Reading intelligently...       	done:  52766 kB/s  24.3 %CPU
Seeker 1...Seeker 2...Seeker 3...start 'em...done...done...done...
              ---Sequential Output (nosync)--- ---Sequential Input-- --Rnd 
Seek-              -Per Char- --Block--- -Rewrite-- -Per Char- --Block--- 
--04k (03)-Machine    MB K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU K/sec 
%CPU   /sec %CPUnotch  1* 512 13874 98.1107497 93.1 10629  6.0 11554 75.6 
52766 24.3  279.6  1.0

So... is this appropriate for two fast disks ? 10MB/sec are much better, but 
I was thing of 40 or 50 MB/sec. Am I doing anything wrong ?

pwk.linuxfan
