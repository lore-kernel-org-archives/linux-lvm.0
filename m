Message-ID: <4F998A2C.6030909@redhat.com>
Date: Thu, 26 Apr 2012 19:47:24 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <20120424132419.GA2244@bdmcc-us.com>
	<20120426145811.GA3329@bdmcc-us.com> <4F997C15.6090300@redhat.com>
	<20120426172338.GA1355@bdmcc-us.com>
In-Reply-To: <20120426172338.GA1355@bdmcc-us.com>
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
To: Brian McCullough <bdmc@bdmcc-us.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 04/26/2012 07:23 PM, Brian McCullough wrote:

>> You said you have missing PV, right?
> 
> In the case of the machine in question, the original "disk" was found to
> be too small by the user, and another qcow file was created to handle
> the excess.
> 
> Last Tuesday ( a week+ ago ), the primary Sysadmin for the host machine
> rebooted the machine for various reasons, I understand, and afterward
> this VM would not restart, with a missing PV.
> 
> 
> 
>> - why the PV is missing? What exactly happened?
>> (overwritten, removed from system, hw failed?)
> 
> The qcow file is still there, but LVM claims that it is missing, from
> what I understand from the messages.

Are you sure that VM see that second qcow file content? I don't think so.

It seems lvm is not your problem at all. I guess once you fix your
VM configuration lvm will activate that without any data lost.

Or is that qcow file corrupted?

Check with lsblk (if available) and /dev/ that you _really_ physical
device which was added later. If not, the question is what
changed in your VM that after reboot it is not visible?

Check log when starting VM - it must log that second qcow is used.
Check log inside guest - which device were there (/dev/vdc?) and
now missing... etc

> unknown device eyeball  lvm2 a-   40.00g 20.00g kXXFhn-oalZ-9D12-0CvG-6b4w-RjcE-Jb171k

>   LV     VG      Attr   LSize   Origin Snap%  Move Log Copy%  Convert Devices          
> home   eyeball -wi---  89.89g /dev/vdb2(2268)  
> home   eyeball -wi---  89.89g unknown device(0)

From this I guess 20GB of data missing on the end of home. quite a lot...

>> All recovery now depends on info above and what you really want:
>>
>> 1) either you have old disk and you want to recover metadata on it
>> and attach it back to VG
>>
>> 2) or you want just recover data from existing PVs
>> (replace missing PV segments with zeroes for example)
>>
>> 3) or you want completely remove all LVs which were even partially on this
>> lost PV (no data recovery, just make VG consistent again)
>>
>> What is the option you want to do? I guess 2) ?
> 
> You are correct.  Number 2 is my goal.

With the info above I think you should try 1) first :)

Milan
