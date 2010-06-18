Message-ID: <4C1BA871.9030800@redhat.com>
Date: Fri, 18 Jun 2010 13:10:09 -0400
From: Takahiro Yasui <tyasui@redhat.com>
MIME-Version: 1.0
References: <4C17D1BF.9010103@redhat.com>
	<4C17E16B.8000708@cfl.rr.com>	<4C17E56D.5010808@redhat.com>
	<4C181C07.9080001@cfl.rr.com>	<4C18999F.9000903@redhat.com>
	<4C19259F.2040706@redhat.com>	<4C19DB6C.2030905@redhat.com>
	<4C1A28DE.4040605@redhat.com>	<4C1B826B.1010200@redhat.com>
	<4C1B87C1.3090303@redhat.com>
	<20100618155245.GH15698@agk-dp.fab.redhat.com>
In-Reply-To: <20100618155245.GH15698@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Why does every lvm command insist on touching	every
 pv?
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
To: linux-lvm@redhat.com

On 06/18/10 11:52, Alasdair G Kergon wrote:
> On Fri, Jun 18, 2010 at 10:50:41AM -0400, Takahiro Yasui wrote:
>> For example, there are six PVs and two VGs as below:
>>
>>   VG1: PV1, PV2, PV3
>>   VG2: PV4, PV5, PV6
>>
>> If we create a new LV or delete VG1, then metadatas on only PV1, PV2, PV3
>> need to be updated but not for PV4, PV5, PV6.
>  
> Correct - and the tools have always behaved like that!

Did I miss something? Or can we configure lvm.conf to make lvm
commands behave like that? That's the first topic we were talking
about. As far as I use lvm commands, they don't behave as I expected.

Thanks,
Taka
