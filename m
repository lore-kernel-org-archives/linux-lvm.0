Message-ID: <00b001bec78c$27a49940$0102010a@adminstation.sgymsdam.nl>
From: "Lennert Buytenhek" <buytenh@dsv.nl>
Subject: Re: [linux-lvm] Re: ext2resize
Date: Tue, 6 Jul 1999 10:47:17 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

>John Finlay wrote:
>> Lennert Buytenhek wrote:
>> Yes, for a 1kb block size. One of my ext2 linux kernel headers #defines
>> the max number of groups to be 1024. Times 32 bytes per group
>> descriptor is 32kb, which is 32 blocks on 1kb. Unless the header is
>> wrong, of course.
>
>I don't think this is correct. I have an ext2 filesystem that is 52GB. It
>appears to have 200+ blocks in the GDT and as I recall 6000+ block groups.
I
>made a 86GB filesystem the other day with 1k blocks and it had 10000+ block
>groups. With 4k blocks there were 650+ block groups.

ext2resize will probably not handle this (it assumes the max. is
1024). I'll fix this in a few days.

Lennert
