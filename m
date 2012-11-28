Message-ID: <50B6183E.9020404@redhat.com>
Date: Wed, 28 Nov 2012 14:57:18 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <1045065586.477.16.camel@dev-ehopper.tiecommerce.com>
	<20030214172615.GA2438@fib011235813.fsnet.co.uk>
	<loom.20121128T142616-703@post.gmane.org>
In-Reply-To: <loom.20121128T142616-703@post.gmane.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How to handle Bad Block relocation with LVM?
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
Cc: Brian Murrell <brian@interlinx.bc.ca>

Dne 28.11.2012 14:27, Brian Murrell napsal(a):
> Joe Thornber <joe <at> fib011235813.fsnet.co.uk> writes:
>>
>> Eric,
>>
>> We would like to automate the process that you have described in LVM2
>> at some point.  So if you get an error on an LV and new PE will be
>> allocated, as much data as possible copied from the bad PE to the new
>> PE, and then remap the LV so that it's using the new PE (very much
>> like a small pvmove).
>>
>> The EVMS team are writing a bad block relocator target for device
>> mapper, but I don't feel it's neccessary to add yet another device
>> layer to the LVs.  If I have a bad block I don't mind loosing a whole
>> PE (people may not agree with me on this ?)
>
> To resurrect a really, really, old thread, did anything ever get done in LVM2
> to either automatically or manually map out PEs with bad blocks in them?
>
> Does anyone have a recipe for doing this -- to save me the time of figuring it
> all out for myself?


Sorry, no automated tool.

You could possibly pvmove separated PEs manually with set of pvmove commands.
But I'd strongly recommend to get rid of such broken driver quickly then you 
loose any more data - IMHO it's the most efficient solution cost & time.

Zdenek
