Received: from localhost (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF3A520283A3
	for <linux-lvm@redhat.com>; Wed, 13 Jun 2018 09:43:04 +0000 (UTC)
Date: Wed, 13 Jun 2018 10:43:03 +0100
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20180613094303.53zhqymzojhr5dsx@reti>
References: <5B1F8BE7020000F90002293C@prv1-mh.provo.novell.com>
	<20180612142219.ixpzqxqws3qiwqbm@reti>
	<5B207DF9020000F900022B0E@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5B207DF9020000F900022B0E@prv1-mh.provo.novell.com>
Subject: Re: [linux-lvm] Some questions about the upcoming LVM v2_02_178
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

On Tue, Jun 12, 2018 at 08:14:17PM -0600, Gang He wrote:
> Hello Joe,
> 
> 
> >>> On 2018/6/12 at 22:22, in message <20180612142219.ixpzqxqws3qiwqbm@reti>, Joe
> Thornber <thornber@redhat.com> wrote:
> > On Tue, Jun 12, 2018 at 03:01:27AM -0600, Gang He wrote:
> >> Hello List,
> >> 
> >> I saw there was a tag "v2_02_178-rc1" for LVM2, then I have some questions 
> > about  the upcoming LVM v2_02_178.
> >> 1) Will there be the version v2_02_178 for LVM2? since I saw some text about 
> > Version 3.0.0 in the git change logs.
> > 
> > Yes there will be.  We've had no bug reports for the -rc, so the final
> > release will be the same as the -rc.
> Between LVM2 v2_02_178-rc1 and  LVM2 v2_02_177, 
> there will not be any components/features remove, except include some bug fixes, right?


178 dropped support for two very old metadata formats (pool and lvm1), and switched
to async io all io ops apart from logging.
