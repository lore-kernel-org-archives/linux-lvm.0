Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1O0u6i25349
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2004 19:56:07 -0500
Received: from kldp.net (kldp.org [211.39.143.146])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1O0u6b30709
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2004 19:56:06 -0500
Received: from kss by kldp.net with local (Exim 3.35 #1 (Debian))
	id 1AvQrj-0005ZN-00
	for <linux-lvm@redhat.com>; Tue, 24 Feb 2004 09:56:03 +0900
From: Soon-Son Kwon <kss@kldp.org>
Message-ID: <20040224005603.GA17483@kldp.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] lvm size mismatch?
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Feb 23 19:56:20 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi I am using lvm on debian woody.
The version would be about 1.0.x.

foo:/var# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/sda1              11G  8.1G  1.9G  81% /
/dev/vol/var           18G   16G  2.7G  85% /var
/dev/vol/home         4.9G  1.8G  3.1G  36% /home
/dev/vol/tmp          500M   61M  439M  13% /tmp
/dev/extra/data        70G  9.5G   60G  14% /data

foo:/var# du . -sh
5.4G    .
foo:/var#

Please take a look at /dev/vol/var which is 18G big and it says
16G is already used.

But when I check the disk usage by running du command, it shows
only 5.4G is used.

Then...where does this size mismatch come from?
-- 
-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
  Shawn Soon-Son Kwon, founder and leader of KLDP
           ( http://kldp.org ,  http://kldp.net )
  Phone: 82-16-535-7282  Homepage: http://kldp.org/~kss
-*-*-*-t-h-e-*-o-p-e-n-*-s-o-u-r-c-e-*-c-o-m-m-u-n-i-t-y-
