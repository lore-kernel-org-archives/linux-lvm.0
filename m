Message-ID: <4B2AF32F.5080705@redhat.com>
Date: Thu, 17 Dec 2009 22:12:47 -0500
From: Takahiro Yasui <tyasui@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: brainfart: lilo'd a PV
References: <1261093282.21162.564.camel@pc.interlinx.bc.ca>	<4B2AD174.40402@redhat.com>	<1261101785.21162.712.camel@pc.interlinx.bc.ca>
	<20091218021658.GA20200@us.ibm.com>
In-Reply-To: <20091218021658.GA20200@us.ibm.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

malahal@us.ibm.com wrote:
> Brian J. Murrell [brian@interlinx.bc.ca] wrote:
>> On Thu, 2009-12-17 at 19:48 -0500, Takahiro Yasui wrote: 
>>> Yes. The area begin with "LABELONE" is PV label,
>> Looks like the LVM developers foresaw my brainfart and left the first
>> sector of the disk for me to bugger up without buggering up LVM.  :-)
> 
> Partition table uses the first sector (0th sector), so pretty much every
> other software that uses labels avoid the first sector.
> 
>>> which is recorded in
>>> the first sector by default.
>> Hrm.  Do you really mean "first" there or second, which is sector 1 if
>> you start counting with 0?
> 
> He really meant sector 1!

Oops, sorry for confusion. The sector number begins with 0,
so the sector 1 should have been written as the "second" sector.

Thank you for correction, Malahal.

Thanks,
Taka
