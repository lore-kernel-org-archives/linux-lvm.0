Message-ID: <3EC788E9.9020701@adelphia.net>
From: Toby <tkb9@adelphia.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Newbie to snapshot
References: <001501c31d2a$0ea25f20$6c7745cb@codevel>
In-Reply-To: <001501c31d2a$0ea25f20$6c7745cb@codevel>
Content-Transfer-Encoding: 7bit
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
Date: Sun May 18 08:21:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

armani wrote:
> Hello List
> 


> 
> As the description, I make a Original LV device named /dev/Vol1/LV1,
> and then I make a snapshot device named "/dev/Vol1/snapshot" for
> /dev/Vol1/LV1 .
> So I try to put something for /dev/Vol1/LV1
> 
> # mount /dev/Vol1/LV1 /mnt/LV1
> # mount /dev/Vol1/snapshot /mnt/snapshot [ I'm using ext3 ]
> # dd if=/dev/zero of=/mnt/LV1/test bs=1M count=10
> 

A snapshot will only capture what you have in the fs at the moment you
create the snapshot - like a photograph. After creation, the two are
totally independent of each other ( for most practical purposes.)

So to test it, just make another snapshot. The 2nd snapshot will now
contain your 10M test file. If you delete it out of the original fs, the
2nd snapshot will still have your test file.


-toby
