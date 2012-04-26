Date: Thu, 26 Apr 2012 13:23:38 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
Message-ID: <20120426172338.GA1355@bdmcc-us.com>
References: <20120424132419.GA2244@bdmcc-us.com>
	<20120426145811.GA3329@bdmcc-us.com> <4F997C15.6090300@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4F997C15.6090300@redhat.com>
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

On Thu, Apr 26, 2012 at 06:47:17PM +0200, Milan Broz wrote:
> On 04/26/2012 04:58 PM, Brian McCullough wrote:
> > On Tue, Apr 24, 2012 at 09:24:19AM -0400, Brian McCullough wrote:
> >> I have encountered a situation where vgscan and vgchange are complaining
> >> about a missing UUID.
> >>
> >> As far as I know, all, or almost all, of the LV is on the PV that is
> >> known ( how do I know for sure? ), so I think that I am trying to just
> >> "remove" the PV and recover what I can of the LV.
> > 
> > Sorry to be dense, but I don't feel confident about proceeding before I
> > know what the next step should be.
> 
> It is not clear what exactly you are trying to do and what how your configuration
> looks like.

I'm sorry to be unclear.  I will try and explain.




To begin with, this is a KVM Virtual Machine living in an Ubuntu 11.10 (
recently upgraded ) environment.

For each VM, I have created an LV in the host, which contains the .qcow
files, usually one per VM, which are the "virtual disks."



> You said you have missing PV, right?

In the case of the machine in question, the original "disk" was found to
be too small by the user, and another qcow file was created to handle
the excess.

Last Tuesday ( a week+ ago ), the primary Sysadmin for the host machine
rebooted the machine for various reasons, I understand, and afterward
this VM would not restart, with a missing PV.



> - why the PV is missing? What exactly happened?
> (overwritten, removed from system, hw failed?)

The qcow file is still there, but LVM claims that it is missing, from
what I understand from the messages.


pvs -o +uuid looks like:

  PV             VG       Fmt  Attr PSize  PFree  PV UUID                               
/dev/vda5      eyeball4 lvm2 a-    9.76g     0 cL9Emm-3uB0-KRxV-561E-bdaC-r3c3-YLlRzA
/dev/vdb2      eyeball  lvm2 a-   78.75g     0 FqSnyb-GUGF-Iz2u-FTSN-SYHS-hIR2-b7vy73
unknown device eyeball  lvm2 a-   40.00g 20.00g kXXFhn-oalZ-9D12-0CvG-6b4w-RjcE-Jb171k


> - what was on that missing PV? e.g. which part of LV?
> 
> ("lvs -o +devices" should tell, paste it somewhere, if
> it is the first segment missing, you will perhaps not recover fs on it)

I understand.  What I gather from lvs is that it is the last segments.

  LV     VG      Attr   LSize   Origin Snap%  Move Log Copy%  Convert Devices          
home   eyeball -wi---  89.89g /dev/vdb2(2268)  
home   eyeball -wi---  89.89g unknown device(0)
root   eyeball -wi-a- 332.00m /dev/vdb2(0)     
swap_1 eyeball -wi-a- 732.00m /dev/vdb2(1990)  
tmp    eyeball -wi-a- 380.00m /dev/vdb2(2173)  
usr    eyeball -wi-a-   4.66g /dev/vdb2(83)    
var    eyeball -wi-a-   2.79g /dev/vdb2(1275)


I can see, and if I do a vgchange --partial, I can mount and read
everything except home, which is where the "critical" data is.



> All recovery now depends on info above and what you really want:
> 
> 1) either you have old disk and you want to recover metadata on it
> and attach it back to VG
> 
> 2) or you want just recover data from existing PVs
> (replace missing PV segments with zeroes for example)
> 
> 3) or you want completely remove all LVs which were even partially on this
> lost PV (no data recovery, just make VG consistent again)
> 
> What is the option you want to do? I guess 2) ?

You are correct.  Number 2 is my goal.



> (btw all situations are described on my slides you mentioned,
> http://mbroz.fedorapeople.org/talks/LinuxAlt2009_2/ - but it is possible
> some info is not up to date, there were some small changes.
> And I borrowed some info from Bryn lvm recovery talk as well)

Perhaps I wasn't reading clearly, but if your number 2 was in those
slides, I didn't understand how to apply it to my situation.


> > I am pretty sure that I can remove the "lost" PV, using the
> > instructions that I have found in multiple places, including the
> > referenced slide deck, but I have not been able to find anything about
> > recovering the LV that spans from the existing PV into the lost one.
> 
> See the section for missing_stripe_filler and --partial activation
> (default stripe filler is "error" - all IO on missing segment fails
> with io error)

I think that there were missing steps ( for me, they might actually 
have been there ) in this process.  I got lost in this area.  Yes, I
think I saw you create the "empty" section, but didn't understand how
you involved it in the recovery process.


> vgchange/lvchange should then replace these missing with this filler.
> 
> (See how you can use "zero" replacement on my slides above. This
> is better for data recovery, similar to dd_rescue job)

I have had friends recommend dd_rescue for physical drive recovery, but
didn't see how to apply it here, and didn't think to do so.


I was about to ask more questions, but I think that I will let you guide
me in the direction I need to go, whether with more information that I
can provide, or in the solution steps.


> Milan

Thank you,
Brian
