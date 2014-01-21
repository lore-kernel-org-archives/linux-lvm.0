Received: from [10.34.131.133] (dhcp131-133.brq.redhat.com [10.34.131.133])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s0L82SVJ014446
	for <linux-lvm@redhat.com>; Tue, 21 Jan 2014 03:02:29 -0500
Message-ID: <52DE2993.1030901@redhat.com>
Date: Tue, 21 Jan 2014 09:02:27 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <52D67EC0.3060107@linux.vnet.ibm.com>	<52D67FF0.7070608@linux.vnet.ibm.com>
	<52DD1AA0.5000304@linux.vnet.ibm.com>
In-Reply-To: <52DD1AA0.5000304@linux.vnet.ibm.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Request to spin a new version of LVM2 to support
	ppc64le
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 20.1.2014 13:46, ARAVINDA B THUNUGUNTLA napsal(a):
> Hi all,
>
> Can you please tell whom to contact for this ?
>
> Thanks in advance,
> Aravind
>
> On Wednesday 15 January 2014 06:02 PM, ARAVINDA B THUNUGUNTLA wrote:
>> Hi,
>>
>> I am working on a new architecture - ppc64le (powerpc 64-bit Little Endian)
>> and I am building LVM2 package on our ppc64le environment downloaded from
>> ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.104.tgz
>> <www.libssh2.org/download/libssh2-1.4.3.tar.gz>
>> I found that LVM2 would require a patch to config.guess [or needs to pick up
>> the latest automake (1.13.4 or above) version] from upstream.
>>
>> The latest config.guess which has ppc64le patch can be found at :
>> http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD.
>>
>>
>> Can you please pick this up and spin a new version which would support ppc64le?
>>
>> Please let me know if you need any help.
>>


I'm not exactly sure what you are asking for?

LVM2 provides preconfigured automake & autoconf files purely for the purpose
of very simple checkout and build without the need to install those packages.

On the other hand - if you have those packages installed - you could very
easily reconfigure whole package to use those version from your system.

The most typical way should be to run  'autoreconf'.

As of now - some very old automake tools are used to create those git files,
I think it comes from Fedora 14.

Zdenek
