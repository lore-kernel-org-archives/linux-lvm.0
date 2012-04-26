Message-ID: <4F997C15.6090300@redhat.com>
Date: Thu, 26 Apr 2012 18:47:17 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <20120424132419.GA2244@bdmcc-us.com>
	<20120426145811.GA3329@bdmcc-us.com>
In-Reply-To: <20120426145811.GA3329@bdmcc-us.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 04/26/2012 04:58 PM, Brian McCullough wrote:
> On Tue, Apr 24, 2012 at 09:24:19AM -0400, Brian McCullough wrote:
>> I have encountered a situation where vgscan and vgchange are complaining
>> about a missing UUID.
>>
>> As far as I know, all, or almost all, of the LV is on the PV that is
>> known ( how do I know for sure? ), so I think that I am trying to just
>> "remove" the PV and recover what I can of the LV.
> 
> Sorry to be dense, but I don't feel confident about proceeding before I
> know what the next step should be.

It is not clear what exactly you are trying to do and what how your configuration
looks like.

Btw there are several examples as well
http://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6/html/Logical_Volume_Manager_Administration/mdatarecover.html

You said you have missing PV, right?

- why the PV is missing? What exactly happened?
(overwritten, removed from system, hw failed?)

- what was on that missing PV? e.g. which part of LV?

("lvs -o +devices" should tell, paste it somewhere, if
it is the first segment missing, you will perhaps not recover fs on it)

All recovery now depends on info above and what you really want:

1) either you have old disk and you want to recover metadata on it
and attach it back to VG

2) or you want just recover data from existing PVs
(replace missing PV segments with zeroes for example)

3) or you want completely remove all LVs which were even partially on this
lost PV (no data recovery, just make VG consistent again)

What is the option you want to do? I guess 2) ?

(btw all situations are described on my slides you mentioned,
http://mbroz.fedorapeople.org/talks/LinuxAlt2009_2/ - but it is possible
some info is not up to date, there were some small changes.
And I borrowed some info from Bryn lvm recovery talk as well)

> I am pretty sure that I can remove the "lost" PV, using the
> instructions that I have found in multiple places, including the
> referenced slide deck, but I have not been able to find anything about
> recovering the LV that spans from the existing PV into the lost one.

See the section for missing_stripe_filler and --partial activation
(default stripe filler is "error" - all IO on missing segment fails
with io error)

vgchange/lvchange should then replace these missing with this filler.

(See how you can use "zero" replacement on my slides above. This
is better for data recovery, similar to dd_rescue job)

Milan
