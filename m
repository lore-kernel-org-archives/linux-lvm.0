Date: Tue, 5 Mar 2019 10:36:31 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20190305163631.GD1155@redhat.com>
References: <11dcbee0-ec65-d5d2-b07c-9937b99cc5b4@linux.ibm.com>
	<d60d4e1c-ad67-8f3f-b159-13cb3923447f@gmail.com>
	<eb3fb7e3-9946-f266-815e-4b49c997e3a4@linux.ibm.com>
	<30346b34-c1e1-f7ba-be4e-a37d8ce8cf03@gmail.com>
	<1576db4f-1d7c-6894-d9b0-69c51852b11c@linux.ibm.com>
	<325bbb01-1b67-eafb-025e-4bfde1b16b54@gmail.com>
	<alpine.LRH.2.21.1903041908110.14821@fairfax.gathman.org>
	<328b148e-61ff-1099-5362-3e799407580c@linux.ibm.com>
	<80ee50b6-4d44-90d1-b38e-4072ebbc7cbf@izyk.ru>
	<CAMRbyyvi=eqOAaj40WGSTS1+125dd+a=u8tyby6CHNpEOGVovw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRbyyvi=eqOAaj40WGSTS1+125dd+a=u8tyby6CHNpEOGVovw@mail.gmail.com>
Subject: Re: [linux-lvm] Filesystem corruption with LVM's pvmove onto a PV
 with a larger physical block size
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nir Soffer <nsoffer@redhat.com>
Cc: Ingo Franzki <ifranzki@linux.ibm.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Mar 05, 2019 at 06:29:31PM +0200, Nir Soffer wrote:
> I don't this way of thinking is useful. If we go in this way, then write()
> should not
> let you write data, and later maybe the disk controller should avoid this?
> 
> LVM is not a low level tool like dd. It is high level tool for managing
> device mapper,
> and providing high level tools to create user level abstractions. We can
> expect it
> to prevent system administrator from doing the wrong thing.
> 
> Maybe LVM should let you mix PVs with different logical block size, but it
> should
> require --force.
> 
> David, what do you think?

LVM needs to fix this, your solution sounds like the right one.
