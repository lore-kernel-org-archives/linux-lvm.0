From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@users.sourceforge.net>
Message-ID: <yw1xy8vmfjq2.fsf@users.sourceforge.net>
References: <20031015130801.49215.qmail@web41307.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: once again about 2.6 kernel
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
Date: Wed Oct 15 13:19:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Valentine Kouznetsov <vkuznet@yahoo.com> writes:

> I had a look at lvm mailing list about kernel 2.6
> questions. So far I understood that in order to run
> 2.6 kernel with LVM2 on a system which previously run
> 2.4 kernel with LVM1 you need
> 1) patch 2.4 kernel with device-mapper patch
> 2) use new LVM2 tools (LVM2.2.00.07) which need to be
> installed separetly on the system to allow
> simulteneously use LVM1 and LVM2

LVM2 doesn't require any changes to the disks.  It will understand the
LVM1 metadata.  You don't need to patch your 2.4 kernel to use
device-mapper in 2.6, either.  They can both peacefully coexist, as
long as your boot scripts run the right version of the tools.  A
somewhat ugly solution is to run both version, since only one of them
will do anything anyway.

-- 
M�ns Rullg�rd
mru@users.sf.net
