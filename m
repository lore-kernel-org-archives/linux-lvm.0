Return-Path: <oswa@irg.canit.se>
Date: Wed, 30 May 2001 12:48:38 +0200
From: Oscar Wahlberg <oscar.wahlberg@home.se>
Subject: Re: [linux-lvm] Problem extending a LV
Message-ID: <20010530124838.A1615@irg.canit.se>
References: <20010529120104.C29771@sistina.com> <Pine.LNX.4.33.0105291333520.8330-100000@UberGeek.coremetrics.com> <20010529235523.B1414@gatekeeper.osp.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010529235523.B1414@gatekeeper.osp.nl>; from josv@osp.nl on Tue, May 29, 2001 at 11:55:23PM +0200
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: AJ Lewis <lewis@sistina.com>
Cc: linux-lvm@sistina.com

Quoting josv@osp.nl <josv@osp.nl>:
> 
> You mention that Veritas (presumably the Volume Manager) has this
> functionality. Are you sure that you can add a subdisk to a striped plex
> in a volume? I'm just curious because I can not remember that this is
> actually possible....
>
> ++Jos


Yes, you can add/remove columns(would be a sd in your case) in a striped plex
with VxVM. 
ex: vxassist -g <dgname> relayout <volname> ncol=5

-- 
Oscar Wahlberg <oscar.wahlberg(at)home.se>
"There are only two industries that refer to their customers 
as 'users'." --Edward Tufte
