Return-Path: <dice@mfa.kfki.hu>
Date: Mon, 18 Jun 2001 18:09:25 +0200 (CEST)
From: Gergely Tamas <dice@mfa.kfki.hu>
Message-ID: <Pine.LNX.4.33.0106181808530.27064-100000@falka.mfa.kfki.hu>
MIME-Version: 1.0
Subject: [linux-lvm] Re: another nice feature for packagers ...
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi!

 > No problem, I'm still trying to decide if we should move ${DESTDIR} into the
 > individual 'install' targets or not...

Thats a good question. :) I tried your version, and it worked well. The
location of the configuration files is defived in a header file, so this
is not a problem. The static links worked also well...

 > Hmm...I think it should be the other way around.

Yes, I thought about this version too... It doesn't metter which one you
choose, as long as there are separate definitions for static and shared
libraries, I think. So they have not to be moved manually...

 > Just FYI, the entire build system is going to get an overhaul after the 1.0
 > release, so I will definitely be making sure these detail are kept in mind
 > for that.

Which will be released this wednesday as I can remember, right?

Thanks,
Gergely
