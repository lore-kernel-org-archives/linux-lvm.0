References: <7217e1f7-ccbe-e072-e8fc-6bf0fac92b0a@greenunit.de>
From: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <0c35d57d-0f3d-02ad-e314-c4272365154e@redhat.com>
Date: Tue, 10 Jul 2018 10:50:29 +0200
MIME-Version: 1.0
In-Reply-To: <7217e1f7-ccbe-e072-e8fc-6bf0fac92b0a@greenunit.de>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Error on RegEx with lv_tags-fields
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
Content-Type: text/plain; charset="utf-8"
To: Oliver Rath <oliver@greenunit.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 07/09/2018 11:11 AM, Oliver Rath wrote:
> Hi list,
> 
> Im trying to sort some output with lvs using a regex "=~", which results
> in an error:
> 
> # lvs -o lv_name,lv_tags -S 'lv_tags=~mac1'
>   dm_report: incompatible comparison type for selection field lv_tags
> 
> Otherwise, using the =~ operator on lv_names works well:
> 
> # lvs -o lv_name -S 'lv_name=~z'
>   LV 
>   z1 
>   z2 
>   z3 
> 
> If I see right, I can use the selection type "string list" here, but no
> regex. Is this right? Is there a way to use regex on tags?
> 

This is not supported yet... but I think we should be able to extend the
functionality here. You can file an upstream report for that if you want
(https://bugzilla.redhat.com/enter_bug.cgi?product=LVM%20and%20device-mapper)
and if there's time/resources, we may add that functionality.

> TfH!
> 
> Oliver
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 


-- 
Peter
