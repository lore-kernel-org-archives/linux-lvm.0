Message-ID: <20030311122715.2418.qmail@ispower.org>
References: <1047381740.16925.116.camel@Zebra.vil.ite.mee.com>
            <20030311113153.GA839@tykepenguin.com>
In-Reply-To: <20030311113153.GA839@tykepenguin.com> 
From: "Joao Rechena" <security@rechena.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: How big are PEs by default?
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Mar 11 06:23:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: linux-lvm@sistina.com

Patrick Caulfield writes: 

> On Tue, Mar 11, 2003 at 11:22:20AM +0000, Paul Furness wrote:
>> Hi. 
>> 
>> I'm trying to get LVM 1.0.7 going on our new production server. I've
>> never used LVM before, but based on reccommendations and looking at what
>> it can do, it looks like exactly what I need. 
>> 
>> For the reccord, it's a SMP Xeon system, running RedHat 7.3 plus current
>> RH patches. 
>> 
>> I am confused about the defualt setting for Physical Extents when you
>> run vgcreate on a new PV.  
>> 
>> Looking through the man page for vgcreate is says this: 
>> 
>>        -s, --physicalextentsize PhysicalExtentSize[kKmMgGtT]
>>               Sets  the  physical extent size on physical volumes
>>               of this volume group. ................. The default
>>               of 32 MB allows LV sizes of ~2TB because as many as
>>               ~64k  extents  are supported per LV. 
>> 
>> A bit later, under "Examples." it says this: 
>> 
>>        To create a volume group named test_vg using physical vol-
>>        umes /dev/hdk1,  /dev/hdl1,  and  /dev/hdm1  with  default
>>        physical extent size of 4MB: 
>> 
>>             vgcreate test_vg /dev/sd[k-m]1 
>> 
>> 
>> So what is the default? 4M or 32M? Or something else? Or should I simply
>> forget about the default and pick a number?
> 
> The default is 32MB, the example has not been updated. It used to be 4MB but
> limiting LVs to 256MB by default soon became a problem for people. 
> 
> 
>  
>> Finally, is there any documentation that's more detailed than the HOWTO,
>> and explains a bit more about the theory of LVM - what happens when you
>> change the size of existing file systems, and so on? The HowTo is ok
>> (although not all that great if you've never patched a kernel before),
>> but necessarily brief. :)

You could try to read the documentation of HP LVM, wich is a little more 
detailed, but be carefull, there are some commands that are diferent.
I dont have the link here with me now but I can search later on. 

Regards 


rech
 --
Joao Rechena
mailto:security@rechena.com
http://www.rechena.com
================================
"Bow before me for I am root" 
