From: Kenneth J Baker <bakerkj@umich.edu>
Subject: [linux-lvm] "logical volume manager already locked"
In-Reply-To: <20020318001846.2dc378a7.orkim@kc.rr.com>
Message-Id: <Pine.LNX.4.44.0203181959380.603-100000@deedee>
MIME-Version: 1.0
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
Date: Mon Mar 18 19:11:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi I've been using lvm on redhat 6.2 with kernel 2.4.5 for a long time.  I
just switched to debian with kernel 2.4.18.  Everything has been working
fine for a week or so.  Debian runs a cron job that runs lvmsadc every so
often.  Now lvmsadc now produces the following error:
deedee:/var# lvmsadc -v
	lvmsadc -- finding all volume group(s)
	lvmsadc -- checking for found volume groups
	1016499384
	lvmsadc -- locking logical volume manager
	lvmsadc -- locking logical volume manager
	lvmsadc -- logical volume manager already locked

I have not been able figure out why this happens, or any explaination for
exactly what this error message means.  Can anyone explain what is wrong?
How I can fix it?  Please let me know if I can provide any other helpful
information.

Thanks for your help,
Ken
