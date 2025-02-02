yarn run v1.22.19
$ /Users/kazuyashirohata/project/study/ozel/node_modules/.bin/prisma migrate diff --from-empty --to-schema-datamodel prisma/schema.prisma --script
-- CreateTable
CREATE TABLE "stadium_tags" (
    "id" SERIAL NOT NULL,
    "stadium_id" INTEGER NOT NULL,
    "tag_id" INTEGER NOT NULL,

    CONSTRAINT "stadium_tags_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stadiums" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name" TEXT,
    "homeTeam" TEXT,
    "capacity" BIGINT,
    "access" TEXT,
    "rating" SMALLINT DEFAULT 0,
    "description" TEXT,
    "location" TEXT,
    "shortName" TEXT,
    "imageUrl" TEXT,

    CONSTRAINT "stadium_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tags" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "tags_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "team_stadium" (
    "id" SERIAL NOT NULL,
    "team_id" INTEGER NOT NULL,
    "stadium_id" INTEGER NOT NULL,

    CONSTRAINT "team_stadium_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teams" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "category" VARCHAR(50),

    CONSTRAINT "teams_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "stadium_tags_stadium_id_tag_id_key" ON "stadium_tags"("stadium_id", "tag_id");

-- CreateIndex
CREATE UNIQUE INDEX "tags_name_key" ON "tags"("name");

-- AddForeignKey
ALTER TABLE "stadium_tags" ADD CONSTRAINT "stadium_tags_stadium_id_fkey" FOREIGN KEY ("stadium_id") REFERENCES "stadiums"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stadium_tags" ADD CONSTRAINT "stadium_tags_tag_id_fkey" FOREIGN KEY ("tag_id") REFERENCES "tags"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "team_stadium" ADD CONSTRAINT "fk_team_id" FOREIGN KEY ("team_id") REFERENCES "teams"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "team_stadium" ADD CONSTRAINT "team_stadium_stadium_id_fkey" FOREIGN KEY ("stadium_id") REFERENCES "stadiums"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

Done in 0.60s.
