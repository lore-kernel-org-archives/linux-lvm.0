Message-ID: <3EAD8E6A.5020608@stella.at>
From: Kai Iskratsch <kai@stella.at>
MIME-Version: 1.0
Subject: Re: [linux-lvm] trying to restore data after Harddisk breakdown
References: <3EABA9DC.2050507@stella.at> <20030427152621.A13215@uk.sistina.com>
In-Reply-To: <20030427152621.A13215@uk.sistina.com>
Content-Transfer-Encoding: 7bit
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
Date: Mon Apr 28 15:26:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

>>-----------------------------------------------
>>first this says that the 120GB disk is my PV0 and the 80 GB is my PV1, 
>>second it says that my 2 working LVs are entirely on the 120 GB 
>>    
>>
>Yes, that's what the metadata says.
>
>And VIDEO was split between all three disks.
>
>  
>
>>and I only need to add the new PV and  replace all the Missing 
>>Segments by one on the new PV?
>>    
>>
>
>If you want to try to salvage something from VIDEO, yes.
>  
>

thats what i wanted to try.

so  i created a new pv on the new disk,  then I edited the backupfile so 
that it has one segment on the new harddisk in it instead of the missing 
parts.
and then i tried to run  vgcfgrestore  first with the -t  option to see 
if the backupfile is correct , and then without (since the VG is a old 
1.0x VG i used the -M 1 option)  in both ways i got this error message

Cannot change metadata for partial volume group Data
Restore failed

how can I restore the metadata to the new disk?

best regards

Kai
