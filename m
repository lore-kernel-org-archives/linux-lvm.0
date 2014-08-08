Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s78IKvmP006230
	for <linux-lvm@redhat.com>; Fri, 8 Aug 2014 14:20:57 -0400
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s78IKtfX028784
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Fri, 8 Aug 2014 14:20:56 -0400
Received: by mail-oa0-f51.google.com with SMTP id o6so4386303oag.24
	for <linux-lvm@redhat.com>; Fri, 08 Aug 2014 11:20:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53E50FB7.6020604@tlinx.org>
References: <53E3CE1C.4050506@tlinx.org>
	<CAE7pJ3BTkSuh9-DB=VR=kiW_ShMdhEO5T_vFWMuZMuEZjgo-RQ@mail.gmail.com>
	<53E50FB7.6020604@tlinx.org>
Date: Fri, 8 Aug 2014 20:20:55 +0200
Message-ID: <CAE7pJ3BX5UK_DscKPMu=8JHFPLz0bJF-m4_nzJh7D5C=0Y6WEg@mail.gmail.com>
From: emmanuel segura <emi2fast@gmail.com>
Subject: Re: [linux-lvm] vgmerge: "your closed volumes are still
	active"...why?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

vgchange -an HnS

2014-08-08 19:58 GMT+02:00 Linda A. Walsh <lvm@tlinx.org>:
> emmanuel segura wrote:
>>
>> first merg the two vgs using vgmerge command
>
> ---
> thanks...urk....ok.. long way around...(want to move a house from one city
> to another,
> but first must merge cities, then logical-house-move from one side of the
> city
> to the other; then un-annex the old-part of the city)...;-/
>
> Um... trying the merge, I get:
>
>>  sudo vgmerge  -v Data HnS
>
>    Checking for volume group "Data"
>    Checking for volume group "HnS"
>  Logical volumes in "HnS" must be inactive
> ---
> Hmm...
>
>> lvs|grep HnS
>
>  Media_Back               HnS     -wi-a----   8.00t
>  Sys                      HnS     -wc-a----  96.00g
>  Sysboot                  HnS     -wc-a----   4.00g
>  Sysvar                   HnS     -wc-a----  28.00g
>  Win                      HnS     -wi-a----   1.00t
>  oHome                    HnS     -wi-a----   1.00t
>
> I guess they are active.  But if they aren't open, what are they
> doing?  And how do I make them inactive (I have a feeling this is
> at the root of why lvremove never works without "-f" as well).
>
> '''
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



-- 
esta es mi vida e me la vivo hasta que dios quiera
