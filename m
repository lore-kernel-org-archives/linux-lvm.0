Date: Sun, 12 Sep 2004 12:48:05 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] How to detect lvm1 configuration using lvm2
	utlititles?
Message-ID: <20040912114805.GJ1094@agk.surrey.redhat.com>
References: <ce9f1f9e0409112054eb75ccf@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce9f1f9e0409112054eb75ccf@mail.gmail.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stanley Yue <stanley.yue@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Sep 11, 2004 at 08:54:08PM -0700, Stanley Yue wrote:
> Using LVM2 utilities and kernel modules, how do we detect lvm1
> configurations/metadata that are stored in the disk?
 
LVM2 tools do it automatically: run 'pvs' and look at the 
'Fmt' column.

> Similiar, using LVM2 utilities, how do we create lvm1
> configurations/metadata that lvm1 utilities can interpret?
 
-M1 - see 'man lvm'.

Alasdair
-- 
agk@redhat.com
