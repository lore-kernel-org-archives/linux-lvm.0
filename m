Date: Wed, 12 Mar 2014 15:58:31 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20140312155830.GA15638@agk-dp.fab.redhat.com>
References: <531ECA9E.6080602@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <531ECA9E.6080602@oracle.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: xiaowei <xiaowei.hu@oracle.com>
Cc: zkabelac@redhat.com, Joe Jin <joe.jin@oracle.com>, linux-lvm@redhat.com

Reproduced with upstream code.

On Tue, Mar 11, 2014 at 04:34:38PM +0800, xiaowei wrote:
> I tracked this a little more, and found that it's due to the strip 1  
> parameter and when the first PV leaves no enough extends, it need 2 area  

It only needs 1 area - that part is correct - but it's still behaving as if
it's setting up an N-stripe extension where it pairs up the allocations with
the original stripes.

Alasdair
