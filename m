Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kA980klE012382
	for <linux-lvm@redhat.com>; Thu, 9 Nov 2006 03:00:46 -0500
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.231])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kA980cch031465
	for <linux-lvm@redhat.com>; Thu, 9 Nov 2006 03:00:38 -0500
Received: by wx-out-0506.google.com with SMTP id s11so107038wxc
	for <linux-lvm@redhat.com>; Thu, 09 Nov 2006 00:00:38 -0800 (PST)
Message-ID: <455431FB.3070701@kix.in>
Date: Fri, 10 Nov 2006 13:32:03 +0530
From: Anant Narayanan <anant@kix.in>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: Anant Narayanan <tg.killerx@gmail.com>
Subject: [linux-lvm] Proposal for the libLVM project
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com
Cc: parted-devel@lists.alioth.debian.org

Hi!

This is regarding a proposal to improve the lvm-tools package currently 
offered by Red Hat. Although your package is an excellent set of tools 
for managing LVM systems, we have found that the codebase is too 
specific to the several LVM Applications that are bundled with your 
distributions.

In the best interest of the community, we feel it would be best to take 
the development of the lvm-tools package in the direction of a more 
generic library - liblvm. The major driving force behind this reasoning 
is the fact that managing LVM setups is a large enough task to warrant a 
separate library. There are several advantages to this approach:

1) Keeping the library and application parts separate. Needless to say, 
this goes a long way in keeping code clean, by preventing the needs of 
the application or library to interfere with each other.

2) Providing a general library for use by other applications that deal 
with LVM setups. This not only encourages alternate LVM-based 
applications to spring, but also invites a larger part of the community 
to contribute back to the development of liblvm (now lvm-tools).

The 2nd point is what concerns us, the GNU Parted team. GNU Parted 
currently deals with block devices only, and therefore cannot operate on 
LVM setups. We concluded that the creation of a library such as liblvm 
would help a lot in adding support for LVM setups.

Here is a rough plan of our intentions:

- Fork the lvm-tools project into liblvm
   (If Red Hat expresses interest in the concept of liblvm, then the 
project may be hosted by Red Hat, and we will provide developers to help 
you. Else, we host the project ourselves)

- Separate the command-line utilities and application-specific code from 
the codebase.

- Formulate (actually complete) a formal API that would be most useful 
for applications that use the library.

- Build the library to be generic as planned, and modify all 
applications currently depending on it (the command-line utilities and 
the Red Hat LVM Application) suitably.

- Use the new library to add LVM support to GNU Parted.

Do let us know what you think of this.

Best Regards,

The GNU Parted Team
