From: "Erick Calder" <e@arix.com>
Message-ID: <008c01c3b605$a311f2a0$c900a8c0@mithrandir>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] RPM for 1.0.8?
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
Date: Fri Nov 28 17:28:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I can't find an RPM for the 1.0.8 version... surely someone's out there on
RH??

I've been trying to make one with the spec file for 1.0.3 (which comes
included in Shriek) but am not having much success...

for one thing, I'm building as a regular user (non-root) and the Makefile
that gets generated uses C<install -o $USER -g $GROUP ...> which, of course
fails when it tries to chown.

I see in configure.in a couple of lines like:

dnl -- setup the ownership of the files
AC_ARG_WITH(user,
  [  --with-user=USER        Set the owner of installed files ],
  [ OWNER="$withval" ],
  [ OWNER="root" ])

but removing them still generates -u for install... I've also tried
C<./configure --without-user> but no dice.

how do I fix this?

- erick
