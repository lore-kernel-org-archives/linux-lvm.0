Return-Path: <lembark@wrkhors.com>
Date: Sun, 10 Jun 2001 19:10:03 -0500
From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
Message-ID: <70680000.992218203@dizzy>
In-Reply-To: <20010611120459.A26558@mail.wave.co.nz>
References: <20010605210727.C1870@pc.ilinx>  
 <3B1F9E1C.1984FAF8@wrkhors.com> <3B1FED48.DB80BF00@tls.msk.ru>  
 <20010608153036.G21909@jensbenecke.de>
 <20010611120459.A26558@mail.wave.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

>> > Another thing to consider if you run 2.4 kernel -- mount tmpfs on /tmp
>> > (and give some reasonable size restrictions).   This way, /tmp works
>> > much faster, does not need to be cleaned on boot, and will not eat
>> > root's space.  You should have reasonable swap space it you plan to
>> > use it heavily.  Works very well here.
>>
>> tmpfs? I thought that existed only on Solaris, and the primary reason for
>> tmpfs is that Solaris's UFS is so ssllooww compared to other FS (e.g.
>> ext2, reiser, etc.)
>
> It's in Linux 2.4 also.  It has the same unfortunate problem as on
> Solaris, that once someone fills /tmp, you run out swap and daemons start
> dying.

Main reason for it on Solaris is systems w/ Large core (4GB+) who  (a) never
ever swap or noticably trim proc's and (b) got annoyed at wasiting 10+GB on
Sun's 2xcore rule for swapspace.  If you have  a4GB system w/ 8GB of 
[unused]
swap the odds of filling up /tmp are rather small.  If you have a 128MB 
system
with 10-20MB of swap in use it's a whole lot more likely.

 As always:  YMMV :-)
