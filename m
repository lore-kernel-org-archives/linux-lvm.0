Message-ID: <1226.24.46.54.254.1031933247.squirrel@mail.scottsavarese.com>
Subject: Re: [linux-lvm] software mirroring
From: "Scott Savarese" <scott@scottsavarese.com>
In-Reply-To: <51730000.1031924802@[192.168.200.4]>
References: <2100.24.46.54.254.1031670341.squirrel@mail.scottsavarese.com>
        <3D7E0CC0.D7B06D44@silicide.dk>
        <2951.24.46.54.254.1031678903.squirrel@mail.scottsavarese.com>
        <20020911080049.GA28187@gw.silicide.dk>
        <1596.24.46.54.254.1031862235.squirrel@mail.scottsavarese.com>
        <51730000.1031924802@[192.168.200.4]>
MIME-Version: 1.0
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
Date: Fri Sep 13 11:08:32 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Yeah, but I wanted to account for future growth of /etc /sbin /lib over
the next several years and I have a strong tendancy to severely overdo my
estimates. :) At least I won't have to redo it for a while...

Scott




Steven Lembark said:
>
>
>> OK...I finally got it to work...However I couldn't put the / or /boot
>> partitions under LVM control which would have been perfect... So I
>> created a
>> 4 Gb / partition which contains /boot as well, and set lilo to boot
>> off of that. Everything else will be under LVM control...
>>
>> I'll keep working on a way to do it with my old box :)...
>>
>> Is there a howto out there on how to combine raid and lvm? Is there a
>> need to write one?
>
> You only need about 128 MB for a working root partition,
> the rest (including /usr) can be LVM.
>
>
> --
> Steven Lembark                               2930 W. Palmer
> Workhorse Computing                       Chicago, IL 60647
>                                             +1 800 762 1582
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
