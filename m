Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2THirj27213
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2004 12:44:53 -0500
Received: from emilia.lsd.ic.unicamp.br (emilia.lsd.ic.unicamp.br
	[143.106.24.129])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2THip1X025783
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2004 12:44:51 -0500
Subject: Re: [linux-lvm] Extents allocation
References: <BAY16-DAV28kO22ZhCl0000884d@hotmail.com>
From: Alexandre Oliva <oliva@lsd.ic.unicamp.br>
Date: 29 Mar 2004 14:43:11 -0300
In-Reply-To: <BAY16-DAV28kO22ZhCl0000884d@hotmail.com>
Message-ID: <orlllj35xs.fsf@free.redhat.lsd.ic.unicamp.br>
MIME-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: sachin <sachindurge@hotmail.com>

On Mar 29, 2004, "sachin" <sachindurge@hotmail.com> wrote:

> lv1 LE  1     to  n      map to PE 1-n     of dev1
> lv1 LE  n+1 to  m     map to PE 1-x     of dev2
> lv1 LE m+1 to  x      map to PE n+1-z of dev1

> I want to know this kind of extent allotment is allowed or not

It is.  Look for LVreorg in my home page for a (not very user
friendly) script that will help you set things up the way you want.

-- 
Alexandre Oliva             http://www.ic.unicamp.br/~oliva/
Red Hat Compiler Engineer   aoliva@{redhat.com, gcc.gnu.org}
Free Software Evangelist  oliva@{lsd.ic.unicamp.br, gnu.org}
