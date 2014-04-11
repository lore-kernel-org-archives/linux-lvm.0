Message-ID: <53474200.1040907@oracle.com>
Date: Fri, 11 Apr 2014 09:14:40 +0800
From: xiaowei <xiaowei.hu@oracle.com>
MIME-Version: 1.0
References: <531ECA9E.6080602@oracle.com>
	<20140312155830.GA15638@agk-dp.fab.redhat.com>
	<532255C5.2050203@oracle.com>
	<20140318040402.GE12820@agk-dp.fab.redhat.com>
In-Reply-To: <20140318040402.GE12820@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Segmentation fault in LVM2 latest version.
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
To: linux-lvm@redhat.com, zkabelac@redhat.com
Cc: Joe Jin <joe.jin@oracle.com>, Alasdair G Kergon <agk@redhat.com>

Hi Alasdair,

May I ask if you have a patch to test for this now?

Thanks,
Xiaowei
On 03/18/2014 12:04 PM, Alasdair G Kergon wrote:
> On Fri, Mar 14, 2014 at 09:05:09AM +0800, xiaowei wrote:
>> That's great you reproduced this bug:)
>> So the fix could be easy?
> No.  Once you know what's wrong, you can find several more classes
> of lvextend that misbehave.
>
> I do have a prototype fix that deals with the case you hit, but it's not
> complete yet.
>
> There are two ways you can extend an LV:
>    1. By pairing up newly-allocated areas of disk with existing ones
>       as you go along.
>       (A simple example would be extending each existing stripe on the same
>       disk.)
>    2. By finding possible areas of disk to fit the required
>       number of areas then selecting the most appropriate ones.
>       (The general case.)
> You can also have a combination of the two, with some areas from 1
> and some from 2.
>
> The first is 'PREFERRED' in the code, and the second is 'USE_AREA'.
> The path through the code that you hit tried to use the first
> method when it should have used the second.
> (If the number of stripes is changing there's no trivial way to
> 'pair up' the new areas with the existing ones.)
> Minor structural changes are needed (code clean up) so that the
> cling policy can sometimes use the second method.
> The default 'allocation/maximise_cling' option fails.
>
> Alasdair
>
