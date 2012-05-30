From: Jim Meyering <jim@meyering.net>
Date: Wed, 30 May 2012 17:05:46 +0200
Message-ID: <87sjehso8l.fsf@rho.meyering.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] preparing for impending switch to git/fedorahosted
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com
Cc: zkabelac@redhat.com

Petr Rockai mentioned that lvm development will soon be
switching away from cvs for good (hurray!), and asked about fixing
some of the warts in the current mirrored-from-cvs git repository.

Now is indeed the best (and only) time to fix any problem you know
about in the repository.

There were many commits with incomplete author/committer name
and/or email address:

    $ git log --pretty=format:%an:%ae|sort -u
    ...
    fabbione:fabbione
    mpatocka:mpatocka
    prajnoha:prajnoha
    snitzer:snitzer
    steve:steve
    taka:taka
    twoerner:twoerner
    zkabelac:zkabelac

The snippet below fixes those listed above, as well as the
typo in Petr's email address.  Here's the resulting list of authors.
If anyone else would like a name/email change, let us know.
I notice that Zdeněk Kabeláč's name is spelled two different ways.
We can fix that, if desired, and if we know which is preferred.

  AJ Lewis:alewis@redhat.com
  Adam Manthei:amanthei@redhat.com
  Alasdair Kergon:agk@redhat.com
  Andres Salomon:dilinger@voxel.net
  Ben Lutgens:blutgens@sistina.com
  Benjamin Marzinski:bmarzins@redhat.com
  Bryn M. Reeves:breeves@redhat.com
  Christine Caulfield:ccaulfie@redhat.com
  Dave Wysochanski:dwysocha@redhat.com
  Fabio M. Di Nitto:fdinitto@redhat.com
  Heinz Mauelshagen:heinzm@redhat.com
  Jim Meyering:jim@meyering.net
  Joe Thornber:joe@fib011235813.fsnet.co.uk
  Jonathan Earl Brassow:jbrassow@redhat.com
  Mike Snitzer:snitzer@redhat.com
  Mikulas Patocka:mpatocka@redhat.com
  Milan Broz:mbroz@redhat.com
  Patrick Caulfield:pcaulfie@redhat.com
  Peter Rajnoha:prajnoha@redhat.com
  Petr Rockai:prockai@redhat.com
  Steven Whitehouse:swhiteho@fedoraproject.org
  Takahiro Yasui:tyasui@redhat.com
  Thomas Woerner:twoerner@redhat.com
  Zdenek Kabelac:zkabelac@redhat.com
  Zdeněk Kabeláč:zkabelac@redhat.com

Here's the "command" to make the above changes.
Anyone can run it just before they push the "initial" repository
into the empty fedorahosted git repository.

git filter-branch -d .git-rebase --env-filter '

case $GIT_AUTHOR_NAME in
  fabbione) n="Fabio M. Di Nitto" e=fdinitto@redhat.com ;;
  mpatocka) n="Mikulas Patocka" e=mpatocka@redhat.com ;;
  prajnoha) n="Peter Rajnoha"  e=prajnoha@redhat.com ;;
  snitzer) n="Mike Snitzer"    e=snitzer@redhat.com ;;
  steve) n="Steven Whitehouse" e=swhiteho@fedoraproject.org ;;
  taka) n="Takahiro Yasui"     e=tyasui@redhat.com ;;
  twoerner) n="Thomas Woerner" e=twoerner@redhat.com ;;
  zkabelac) n="Zdenek Kabelac" e=zkabelac@redhat.com ;;
  # The above are just correcting for missing mail map.
  # This corrects an email address: s/prok/prock/
  "Petr Rockai") n="Petr Rockai" e="prockai@redhat.com" ;;
  *) n=$GIT_AUTHOR_NAME e=$GIT_AUTHOR_EMAIL ;;
esac

export GIT_AUTHOR_EMAIL=$e GIT_AUTHOR_NAME=$n
export GIT_COMMITTER_EMAIL=$e GIT_COMMITTER_NAME=$n

' master

If there are other types of corrections, like improper authorship,
or typos in the commit logs, we can fix those, too.
