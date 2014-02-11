Message-ID: <52FA575E.9040305@redhat.com>
Date: Tue, 11 Feb 2014 18:01:18 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <52FA492B.1050408@funsoft.com>
In-Reply-To: <52FA492B.1050408@funsoft.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Doc or definition of max_archives setting for
	lvm.conf?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: eheman@funsoft.com, LVM general discussion and development <linux-lvm@redhat.com>

Dne 11.2.2014 17:00, Gary Eheman napsal(a):
> There is an example syntax reference to a variable named "max_archives" in the
> man page for lvm.conf, but it does not provide a definition for the variable.
> The actual lvm.conf on my distribution contains no references or comments to
> enlighten me on the specifics for max_archives.  While the variable name
> certainly gives me the clue that it is likely that not more than that many
> archive files would exist in the archive directory, can someone provide a more
> detailed description?
>
> Since I can make no assumptions on this system, is it the case that if the
> max_archives specified in lvm.conf is reached that the oldest archive is
> automatically deleted as the newest one is created?
>
> I have a lot of snapshot activity on the system where I want to implement
> max_archives, and the number of archives keeps growing.  Naturally, I have not
> yet reached the retain_days number of days, but would like to keep the number
> of archives below a reasonable number before retain_days might be reached.


# Configuration of metadata backups and archiving.  In LVM2 when we
# talk about a 'backup' we mean making a copy of the metadata for the
# *current* system.  The 'archive' contains old metadata configurations.
# Backups are stored in a human readable text format.
backup {

     # Should we maintain a backup of the current metadata configuration ?
     # Use 1 for Yes; 0 for No.
     # Think very hard before turning this off!
     backup = 1

     # Where shall we keep it ?
     # Remember to back up this directory regularly!
     backup_dir = "/etc/lvm/backup"

     # Should we maintain an archive of old metadata configurations.
     # Use 1 for Yes; 0 for No.
     # On by default.  Think very hard before turning this off.
     archive = 1

     # Where should archived files go ?
     # Remember to back up this directory regularly!
     archive_dir = "/etc/lvm/archive"

     # What is the minimum number of archive files you wish to keep ?
     retain_min = 10

     # What is the minimum time you wish to keep an archive file for ?
     retain_days = 30
}


Zdenek
