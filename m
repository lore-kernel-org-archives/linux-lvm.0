Message-ID: <3F9C0AC9.6050805@elitedvb.net>
From: Felix Domke <tmbinc@elitedvb.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LV only detected when using "lvscan -D" on amd64
 kernel
References: <3F994F88.8030908@elitedvb.net> <20031025091006.I848@sistina.com>
In-Reply-To: <20031025091006.I848@sistina.com>
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
Date: Sun Oct 26 11:54:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Heinz J . Mauelshagen wrote:

>Felix,
>
>this definitely looks like a 64bit ioctl related problem.
>I don't have the equipment to test here so help (is external access to
>your machine possible ?) is needed.
>  
>
Hi,

i could setup external access to the machine, but be aware that it 
consists of a chroot'ed 64bit hacked-together debian, so compiling 
something with 64bit isn't any fun at all. The 32bit userspace however 
is fine.

I tried to compile the lvmtools as 64bit, but the result didn't change. 
are there any points where i can put some debug printfs/printks in the 
sources to work out where it fails? I never looked at the LVM internals, 
so i don't know what happens where. Does the kernel space reads and 
parses the metadata? Or does the userspace parses it and passes it to 
the kernel?

Felix
