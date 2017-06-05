References: <45cd0f1b-b86a-b0dd-e8c8-d743ea4bd3ab@assyoma.it>
	<c9020a11-12ff-3900-6e5f-8fad09e9d91b@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <4495a5e6-6c92-97c0-c4ba-11d8a78893da@assyoma.it>
Date: Mon, 5 Jun 2017 10:48:54 +0200
MIME-Version: 1.0
In-Reply-To: <c9020a11-12ff-3900-6e5f-8fad09e9d91b@redhat.com>
Content-Language: it-IT
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM send/receive support?
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

Hi Zdenek,
thanks for pointing me to thin_delta - very useful utility. Maybe I can 
code around it...

As an additional question, is direct lvm2 support for send/receive 
planned, or not?

Thanks.

On 05/06/2017 10:44, Zdenek Kabelac wrote:
> Dne 5.6.2017 v 10:11 Gionatan Danti napsal(a):
>> Hi all,
>> I wonder if using LVM snapshots (even better: lvmthin snapshots, which 
>> are way faster) we can wire something like zfs or btrfs send/receive 
>> support.
>>
>> In short: take a snapshot, do a full sync, take another snapshot and 
>> sync only the changed blocks.
>>
>> I know that exists an utility called lvmsync[1], but it seem not 
>> maintained anymore. Any suggestion on how to do something similar?
> 
> 
> Hi
> 
> Unfortunately there is not yet direct lvm2 support - but you can do it 
> manually via  thin-pool and it support tools.
> 
> Look at the tool  'thin_delta'  which you can use exactly for the 
> purpose you describe.
> 
> Regards
> 
> Zdenek
> 

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
