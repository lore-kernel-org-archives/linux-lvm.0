From: Dirk Heinrichs <heini@qis-systemhaus.de>
Subject: Re: [linux-lvm] upgrade RH with lvm
In-Reply-To: <1010772299.7571.14.camel@dumbo.zwecker.de>
Message-Id: <Pine.GSO.4.05.10201140845360.28453-100000@cyrano.olymp.qis>
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
Date: Mon Jan 14 01:51:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On 11 Jan 2002, Christophe Zwecker wrote:

> hi,
> 
> 
> RH7.2 doesnt seem to be able to read lvm partitions when upgrading from
> 7.1, neither does the SGI iso (guess they didnt look into that).
> 
> I wonder if any of you got the same problem if he solved it and how ?
You don't need to boot the installer to upgrade some RPM's. Use rpm
directly on the running system (after going single user with telinit 1, if
you
like).

Bye...

	Dirk
-- 
Dirk Heinrichs          | Tel:  +49 (0)241 413 260
Configuration Manager   | Fax:  +49 (0)241 413 2640
QIS Systemhaus GmbH     | Mail: dheinrichs@qis-systemhaus.de
Juelicher Str. 338      | Web:  http://www.qis-systemhaus.de
D-52070 Aachen          | ICQ#: 110037733
