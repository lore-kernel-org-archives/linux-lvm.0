Date: Sat, 28 Apr 2012 13:01:35 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
Message-ID: <20120428170135.GC1076@bdmcc-us.com>
References: <20120424132419.GA2244@bdmcc-us.com>
	<20120426145811.GA3329@bdmcc-us.com> <4F997C15.6090300@redhat.com>
	<20120426172338.GA1355@bdmcc-us.com> <4F998A2C.6030909@redhat.com>
	<20120426194315.GA2873@bdmcc-us.com> <4F99B3EA.6050401@redhat.com>
	<20120426211320.GA3760@bdmcc-us.com>
	<20120427030806.GB2819@bdmcc-us.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20120427030806.GB2819@bdmcc-us.com>
Subject: Re: [linux-lvm] Missing PV
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
To: Milan Broz <mbroz@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>


Milan,

I promised you an explanation, and here it is.


It was, at least partially, my fault.


I don't really understand why the original VM did not, and would not,
restart correctly.


However, I discovered, after I had made copies of everything and created
a new VM to work with, that there were two different "formats" of
"virtual disk drives," even though they were all called "qcow2."  There
were a combination of "raw" and "qcow2" disks.


Once I got the VM configuration file, and therefore the VM
configuration, matching the formats of the disk drives, I was able to
completely recover the "missing" PV, and therefore the VG and LV.

During my investigation, I had issued a "removemissing," so the LVM
Meta-data was "corrupted," but I edited a copy of that and 
vgcfgrestore corrected everything.


I did an e2fsck of the LV, to make sure, but the user tells me that
everything looks the way that he expected, so far.


So, even though the problem really wasn't what I thought it was, I want
to thank you very much for the patience and guidance toward helping me
find the ( apparent ) real problem.  

I am still not happy about how rebooting the host machine caused so much
damage, with one LV completely losing its contents ( the qcow2 file has
completely disappeared ) and therefore one VM being destroyed, and more
than this one not being able to restart correctly, but at least, most of
the VMs are back in action.


Thanks again,
Brian
