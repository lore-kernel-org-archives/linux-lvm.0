Message-ID: <530E5F36.5070002@redhat.com>
Date: Wed, 26 Feb 2014 22:40:06 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <530E1EA8.9020301@ubuntu.com> <530E30B4.6020505@redhat.com>
	<530E3464.3050606@ubuntu.com> <530E3CAA.1070308@redhat.com>
	<530E541C.9040001@ubuntu.com>
In-Reply-To: <530E541C.9040001@ubuntu.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] libdevmapper's handling of devices with spaces in
	the name
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Phillip Susi <psusi@ubuntu.com>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 26.2.2014 21:52, Phillip Susi napsal(a):
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 2/26/2014 2:12 PM, Zdenek Kabelac wrote:
>> As said - there is no bug in libdm - libdm expects udev to create
>> nodes. You can reconfigure libdm to do this job instead of udev -
>> but then nothing else will work with it - so it's basically
>> dead-road...
>
> It doesn't matter who creates it, what matters is that when parted
> asks what the correct name is, that it be told the name that actually
> is created.
>

I assume you will need to learn why it does matter - it's the crucial part of 
this puzzle - but it's surely not a topic for lvm-devel list.

And as I've also already said - yes it really does mean that many userspace 
tools need be adapted to handle things in more user friendly way.


>> The best you can do is to not use names which needs mangling -
>> that's my best suggestions (and lvm team already spend countless
>> hours on some usable workarounds and solutions...)
>
> Unfortunately, it seems that a number of hardware vendors ship
> preconfigured fakeraid setups with a space in the name of the volume.

It have to be dealt with them properly on user level part.
User level needs to use some different names for such devices.

It's currently highly discouraged to create devices with 'prohibited' 
characters in them - since the rest will fail to process them properly.

You really can't expect  udev will start to support spaces in names....
So tools like 'mount' will need to know how to translate...

>
>> For mangling see 'dmsetup mangle' help - how to obtain device
>> names...
>
> Is there a libdevmapper call to do this?
>


https://git.fedorahosted.org/cgit/lvm2.git/tree/libdm/libdevmapper.h

Look for 'mangle' in function names.

For 'howto' look at dmsetup.c source code:

https://git.fedorahosted.org/cgit/lvm2.git/tree/tools/dmsetup.c

There is not much better doc for these function unfortunately.
I'd strongly advise to stay on 'dmsetup' level of usage.

It would also probably help to describe what kind of app which uses 
libdevmapper you are trying to develop...

Regards

Zdenek
