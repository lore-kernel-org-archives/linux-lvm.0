Message-ID: <51A36198.6010307@redhat.com>
Date: Mon, 27 May 2013 15:37:28 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <51A329CA.2010806@mglug.de>
In-Reply-To: <51A329CA.2010806@mglug.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] thin-provisioning-tools failed compiling on Ubuntu
	13.04
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
Cc: Oliver Rath <rath@mglug.de>

Dne 27.5.2013 11:39, Oliver Rath napsal(a):
> Hi lsit,
>
> i wanted using thin-provisioned lvm-volumes on a new created Ubuntu
> 13.04-machine. Unfortunatly the needed thin-provisinoing-tools dont
> compile anymore.
>
> It seems to be a conflict between a boost-lib and the code
> ("range"-class ambigous). Im using libboost-dev 1.49.0.1.
>
> Any hints to solve this? I appended the log. It is a intel core2duo
> machine (64bit) with 3GB RAM.
>


Looks like name collision with upstream boost range type.
I assume more tight unambiguous   base::range needs to be used:

i.e. something like this:

-missing_devices(std::string const &desc, range<uint64_t> const &keys);
+missing_devices(std::string const &desc, base::range<uint64_t> const &keys);


But it's needed on more places - and there are further complation problems 
with  thin_debug.cc - which needs some extra work to be made.


Zdenek
