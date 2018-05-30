References: <20180525070342.g247jatvm6dskehy@reti>
	<5B07BF2B020000F90001E5BB@prv1-mh.provo.novell.com>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <80318f1a-2b2e-9d0f-ae16-3b1eb0af2740@redhat.com>
Date: Wed, 30 May 2018 12:42:47 +0200
MIME-Version: 1.0
In-Reply-To: <5B07BF2B020000F90001E5BB@prv1-mh.provo.novell.com>
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [RELEASE] 2.02.178
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gang He <ghe@suse.com>

On 05/25/2018 09:45 AM, Gang He wrote:
> Hello Joe,
> 
> When will the formal LVM 2.02.178 be released?

Within two weeks. I have pushed the RC1 to rawhide, and unless problems 
are reported, we will be releasing shortly.

> In LVM2.02.178, online pvmove can work well under the cluster environment?

Yes, the clustered pvmove issues are fixed in 2.02.178.

You need either:
- exclusive activation,
- wait for 2.02.178,
- or patch .177

-- Marian
