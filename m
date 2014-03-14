Message-ID: <532255C5.2050203@oracle.com>
Date: Fri, 14 Mar 2014 09:05:09 +0800
From: xiaowei <xiaowei.hu@oracle.com>
MIME-Version: 1.0
References: <531ECA9E.6080602@oracle.com>
	<20140312155830.GA15638@agk-dp.fab.redhat.com>
In-Reply-To: <20140312155830.GA15638@agk-dp.fab.redhat.com>
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
To: linux-lvm@redhat.com, zkabelac@redhat.com, Joe Jin <joe.jin@oracle.com>

Hi Alasdair,

That's great you reproduced this bug:)
So the fix could be easy?

Thanks,
Xiaowei
On 03/12/2014 11:58 PM, Alasdair G Kergon wrote:
> Reproduced with upstream code.
>
> On Tue, Mar 11, 2014 at 04:34:38PM +0800, xiaowei wrote:
>> I tracked this a little more, and found that it's due to the strip 1
>> parameter and when the first PV leaves no enough extends, it need 2 area
> It only needs 1 area - that part is correct - but it's still behaving as if
> it's setting up an N-stripe extension where it pairs up the allocations with
> the original stripes.
>
> Alasdair
>
